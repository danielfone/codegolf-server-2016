module Tally
  def self.safe_sum(array)
    array.sum rescue nil
  end
end
