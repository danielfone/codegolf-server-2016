$<.map{|l|$><<l.strip.tr(?.,' ').chars.each_slice(3).map{|s|s.join" | "}.join("\n--+---+--\n")+$/+$/}
