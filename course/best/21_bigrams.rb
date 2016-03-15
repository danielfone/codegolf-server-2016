h=Hash.new(0)
$<.read.gsub(/[^\w\s]/,?|).downcase.split.each_cons(2){|a,b|a[-1]==?|||b[0]==?|||h[(a+' '+b).tr ?|,'']+=1}
h.sort_by{|b,o|[-o,b]}.map{|b,o|puts b+": #{o}"if o>1}
