puts (1..1000).map { |el| el.pow(el) }.inject(:+).to_s[-10..]
