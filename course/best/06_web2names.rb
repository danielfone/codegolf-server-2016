puts$<.map{|n|n=~/^(\w*[aeiou]+\w+[^aeiou])[aeiou]+r$/i?$~[1]+?r:n}