puts$<.map{|l|i=l.to_i;i%5<1&&i%3<1?:FizzBuzz:i%5<1?:Buzz:i%3<1?:Fizz:i}