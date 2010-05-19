class Range

=begin rdoc
  Usage: (1..100).print_fizzbuzzdazzkezz(hash)

  By default, the following Hash is presented:
      {3 => :Fizz, 5 => :Buzz, 7 => :Dazz , 9 => :Kezz}
  We use symbols as it is cheaper than using strings.
=end

  def print_fizzbuzzdazzkezz(hash = {7 => :Dazz, 5 => :Buzz, 3 => :Fizz , 9 => :Kezz})
    puts to_fizzbuzzdazzkezz_a(hash)
  end
  
=begin rdoc
  Usage: array = (1..100).to_fizzbuzzdazzkezz_a(hash) 

  By default, the following Hash is presented:
      {3 => :Fizz, 5 => :Buzz, 7 => :Dazz , 9 => :Kezz}
  We use symbols as it is cheaper than using strings.
=end
  def to_fizzbuzzdazzkezz_a(hash = {7 => :Dazz, 5 => :Buzz, 3 => :Fizz , 9 => :Kezz})
    result = []
    self.each do |i|
      str = ''     
      hash.sort.each do |key, value|
        str << value.to_s if i.modulo(key).zero?
      end
      result << (str.empty? ? i.to_s : str)     
    end
    return result
  end  

  alias print_fbdk print_fizzbuzzdazzkezz
  alias to_fbdk_a to_fizzbuzzdazzkezz_a
end # End of class Range

class Integer

=begin rdoc
Usage: int.fizzbuzz(hash = {3 => :Fizz, 5 => :Buzz})

Sample: 
      results = ''
      (1..100).each do |num|
      results << num.fizzbuzz
      end

    puts results
=end

  def fizzbuzz(hash = {3 => :Fizz, 5 => :Buzz})
    results = ''
    hash.to_a.sort.each do |key, value|
      results << value.to_s if modulo(key).zero?
    end
    results.empty? ? to_s : results
  end
  
  alias fizzbuzzdazzkezz fizzbuzz 
end # end of Class Integer


