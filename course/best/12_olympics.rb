a=[*0..9].map{' '*58}
d=->x,y=0{15.times{|i|7.times{|j|a[y+j][x+i]=?*if[672,4100,16385,16385,16385,4100,672][j]&1<<i!=0}}}
d[0]
d[18]
d[36]
d[9,3]
d[27,3]
puts a.map &:rstrip