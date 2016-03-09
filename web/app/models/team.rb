require 'obscenity/active_model'

class Team
  include ActiveModel::Model
  include ActiveModel::Validations::Callbacks

  DB_EXTENSION = "scores.json"

  attr_accessor :name

  after_validation :parameterise_name

  validates :name, {
    presence: true,
    obscenity: { sanitize: true, replacement: "kitten" }
  }

  def self.all
    Dir.glob("#{TEAM_DB}/*.#{DB_EXTENSION}").map { |e| new filename: e }
  end

  def filename=(filename)
    @name = File.basename filename, ".#{DB_EXTENSION}"
  end

  def save
    return false unless valid?
    add_team_to_database
  end

private

  def mkteam!
    `#{BIN_MKTEAM} #{name}`
  end

  def parameterise_name
    self.name = name.parameterize
  end

  def add_team_to_database
    FileUtils.touch File.join TEAM_DB, "#{name}.#{DB_EXTENSION}"
  end

end
