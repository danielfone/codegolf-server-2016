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
    Dir.glob("#{TEAM_DB}/*.#{DB_EXTENSION}")
      .map { |e| new filename: e }
      .sort_by { |t| t.total_score || Float::INFINITY }
  end

  def filename=(filename)
    @filename = filename
    @name = File.basename filename, ".#{DB_EXTENSION}"
  end

  def filename
    @filename ||= "#{TEAM_DB}/#{name}.#{DB_EXTENSION}"
  end

  def save
    return false unless valid?
    add_team_to_database
    mkteam!
    errors.empty?
  end

  def scores
    @scores ||= JSON.parse File.read filename
  rescue
    Array.new(18,nil)
  end

  def total_score
    @total_score ||= Tally.safe_sum scores
  end

private

  def mkteam!
    output = `cd ..; #{BIN_MKTEAM} #{name} 2>&1`
    errors.add :base, output unless $?.success?
  end

  def parameterise_name
    self.name = name.parameterize
  end

  def add_team_to_database
    FileUtils.touch File.join TEAM_DB, "#{name}.#{DB_EXTENSION}"
  end

end
