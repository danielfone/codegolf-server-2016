# Print out the nursery rhyme.

# Code taken Katrina Owen's excellent talk on refactoring
# https://github.com/kytrinyx/one-undo

class Critter < Struct.new(:name, :qualifier, :aside)
  DATA = [
    ["horse", nil, "She's dead, of course!"],
    ["cow", nil, "I don't know how she swallowed a cow!"],
    ["goat", nil, "Just opened her throat and swallowed a goat!"],
    ["dog", nil, "What a hog, to swallow a dog!"],
    ["cat", nil, "Imagine that, to swallow a cat!"],
    ["bird", nil, "How absurd to swallow a bird!"],
    [
      "spider",
      "that wriggled and jiggled and tickled inside her",
      "It wriggled and jiggled and tickled inside her.",
    ],
    ["fly", nil, "I don't know why she swallowed the fly. Perhaps she'll die."],
  ]

  def self.all
    DATA.map {|data| new(*data)}
  end

  def self.last(i)
    all.last(i)
  end

  def epiteth
    [name, qualifier].compact.join(" ")
  end
end

class Song
  def self.lyrics(*args)
    new(*args).lyrics
  end

  def lyrics
    (1..8).map {|i| Verse.new(i)}.join("\n")
  end

  class Verse
    attr_reader :i, :critters, :critter
    def initialize(i)
      @i = i
      @critters = Critter.last(i)
      @critter = critters.first
    end

    def to_s
      incident + aftermath
    end

    private

    def incident
      "I know an old lady who swallowed a %s.\n%s\n" % [
        critter.name, critter.aside
      ]
    end

    def aftermath
      case i
      when 1, 8
        ""
      else
        "%s\n%s\n" % [
          chain, critters.last.aside
        ]
      end
    end

    def chain
      critters.each_cons(2).map {|pair|
        motivation(*pair)
      }.join("\n")
    end

    def motivation(predator, prey)
      "She swallowed the %s to catch the %s." % [
        predator.name,
        prey.epiteth,
      ]
    end
  end
end

puts Song.lyrics
