a=$<.read.tr(?|,' ').split$/
i=!p;t=a.map(&:chars).transpose.map(&:join).select{i^=1}.sort_by{|s|s.tr' _',''}
x=0;t.map{|t|y=0;u=p;t.chars{|c|u&&a[y][x,3]=?|*3;a[y][x+1]=c;y+=1;u|=c=='_'};x+=2}
puts a.join$/
