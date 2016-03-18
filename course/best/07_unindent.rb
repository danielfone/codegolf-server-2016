r=$<.read
puts r.gsub /^#{r.scan(/^[ \t]*\b/).min}/,''
