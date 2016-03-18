#
# Strip extra indentation from a document.
# Effectively aligns the entire document to the left margin
# by removing the same amount of whitespace from each line.
#
# Technically, it looks for the least indented line in the whole string,
# and removes that amount of leading whitespace.

INDENT_REGEX = Regexp.new(%q{
  ^         # from the start of the line...
  [\t ]*    # find zero or more tabs or spaces
  (?=\S)
  }, Regexp::EXTENDED)


document = $stdin.read

minimum_indent = nil
offsets        = []

# Firstly, iterate through all the lines
# record the offset for each
# and find the line with the minimum indentation
document.scan INDENT_REGEX do |match|
  offsets << Regexp.last_match.offset(0).first
  minimum_indent ||= match.size
  minimum_indent = if match.size < minimum_indent.size
    match.size
  else
    minimum_indent
  end
end

unindented_string = document.dup

if minimum_indent
 shift = 0

 # Iterate through each line (via the offsets recorded above)
 # and 'delete' the minimum indentation
 offsets.each do |offset|
   unindented_string[offset - shift, minimum_indent] = ""
   shift += minimum_indent
 end

end

$stdout.printf unindented_string
