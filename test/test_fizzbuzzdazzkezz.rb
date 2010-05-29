require File.expand_path(File.join(File.dirname(__FILE__), "../lib", "fizzbuzzdazzkezz"))
require 'test/unit'


class TC_IntegerFizzBuzz < Test::Unit::TestCase
  #todo loose checking if methods defined ?
  def test_range_methods_defined
    assert_methods_defined(Range,  [:to_fizzbuzzdazzkezz_a, :to_fbdk_a])   
  end
  
  def test_integer_methods_defined
    assert_methods_defined(Integer,  [:fizzbuzzdazzkezz, :fizzbuzz])
  end
  
  def assert_methods_defined(clazz, methods)
    methods.each do |method|
      assert clazz.method_defined?(method), undefined_method_string(clazz, method)
    end
  end
  
  def test_range_to_fdbk_a
    @fizz_buzz_tests.each do |range, hash, expected_value|
      assert_equal expected_value, range.to_fbdk_a(hash), method_call_string(range, :to_fbdk_a, hash)
    end
  end
  
  def test_integer_fizzbuzz    
    @fizz_buzz_tests.each do |range, hash, expected_values|      
      range.each_with_index do |number, i|
        assert_equal expected_values[i], number.fizzbuzz(hash), method_call_string(number, :fizzbuzz, hash)
      end      
    end
  end 
  
  def method_call_string(object, method, *args)
    "method call: %s.%s(%s)" %  [object, method, args.join(', ')] 
  end
  
  def undefined_method_string(clazz, method)
    'undefined method %s.%s' % [clazz.name, method]
  end
  
  def setup
    fizz_bazz_hash = { 5 => :Buzz, 3 => :Fizz }
    dazz_buzz_fizz_kezz_hash = {7 => :Dazz, 5 => :Buzz, 3 => :Fizz , 9 => :Kezz}
    plazz_dazz_buzz_fizz_hash = {2 => :Plazz, 7 => :Dazz, 5 => :Buzz, 3 => :Fizz}
    
    @fizz_buzz_tests = [
    [(1..100), fizz_bazz_hash, ["1", "2", "Fizz", "4", "Buzz", "Fizz", "7", "8", "Fizz", "Buzz", "11", "Fizz", "13", "14", "FizzBuzz", "16", "17", "Fizz", "19", "Buzz", "Fizz", "22", "23", "Fizz", "Buzz", "26", "Fizz", "28", "29", "FizzBuzz", "31", "32", "Fizz", "34", "Buzz", "Fizz", "37", "38", "Fizz", "Buzz", "41", "Fizz", "43", "44", "FizzBuzz", "46", "47", "Fizz", "49", "Buzz", "Fizz", "52", "53", "Fizz", "Buzz", "56", "Fizz", "58", "59", "FizzBuzz", "61", "62", "Fizz", "64", "Buzz", "Fizz", "67", "68", "Fizz", "Buzz", "71", "Fizz", "73", "74", "FizzBuzz", "76", "77", "Fizz", "79", "Buzz", "Fizz", "82", "83", "Fizz", "Buzz", "86", "Fizz", "88", "89", "FizzBuzz", "91", "92", "Fizz", "94", "Buzz", "Fizz", "97", "98", "Fizz", "Buzz"] ],
    [(133..200), dazz_buzz_fizz_kezz_hash, ["Dazz", "134", "FizzBuzzKezz", "136", "137", "Fizz", "139", "BuzzDazz", "Fizz", "142", "143", "FizzKezz", "Buzz", "146", "FizzDazz", "148", "149", "FizzBuzz", "151", "152", "FizzKezz", "Dazz", "Buzz", "Fizz", "157", "158", "Fizz", "Buzz", "Dazz", "FizzKezz", "163", "164", "FizzBuzz", "166", "167", "FizzDazz", "169", "Buzz", "FizzKezz", "172", "173", "Fizz", "BuzzDazz", "176", "Fizz", "178", "179", "FizzBuzzKezz", "181", "Dazz", "Fizz", "184", "Buzz", "Fizz", "187", "188", "FizzDazzKezz", "Buzz", "191", "Fizz", "193", "194", "FizzBuzz", "Dazz", "197", "FizzKezz", "199", "Buzz"] ],
    [(777...800), dazz_buzz_fizz_kezz_hash, ["FizzDazz", "778", "779", "FizzBuzz", "781", "782", "FizzKezz", "Dazz", "Buzz", "Fizz", "787", "788", "Fizz", "Buzz", "Dazz", "FizzKezz", "793", "794", "FizzBuzz", "796", "797", "FizzDazz", "799"]],
    [(333...400), plazz_dazz_buzz_fizz_hash, ["Fizz", "Plazz", "Buzz", "PlazzFizzDazz", "337", "Plazz", "Fizz", "PlazzBuzz", "341", "PlazzFizz", "Dazz", "Plazz", "FizzBuzz", "Plazz", "347", "PlazzFizz", "349", "PlazzBuzzDazz", "Fizz", "Plazz", "353", "PlazzFizz", "Buzz", "Plazz", "FizzDazz", "Plazz", "359", "PlazzFizzBuzz", "361", "Plazz", "Fizz", "PlazzDazz", "Buzz", "PlazzFizz", "367", "Plazz", "Fizz", "PlazzBuzz", "Dazz", "PlazzFizz", "373", "Plazz", "FizzBuzz", "Plazz", "377", "PlazzFizzDazz", "379", "PlazzBuzz", "Fizz", "Plazz", "383", "PlazzFizz", "BuzzDazz", "Plazz", "Fizz", "Plazz", "389", "PlazzFizzBuzz", "391", "PlazzDazz", "Fizz", "Plazz", "Buzz", "PlazzFizz", "397", "Plazz", "FizzDazz"]],
    [(911...977), plazz_dazz_buzz_fizz_hash, ["911", "PlazzFizz", "913", "Plazz", "FizzBuzz", "Plazz", "Dazz", "PlazzFizz", "919", "PlazzBuzz", "Fizz", "Plazz", "923", "PlazzFizzDazz", "Buzz", "Plazz", "Fizz", "Plazz", "929", "PlazzFizzBuzz", "Dazz", "Plazz", "Fizz", "Plazz", "Buzz", "PlazzFizz", "937", "PlazzDazz", "Fizz", "PlazzBuzz", "941", "PlazzFizz", "943", "Plazz", "FizzBuzzDazz", "Plazz", "947", "PlazzFizz", "949", "PlazzBuzz", "Fizz", "PlazzDazz", "953", "PlazzFizz", "Buzz", "Plazz", "Fizz", "Plazz", "Dazz", "PlazzFizzBuzz", "961", "Plazz", "Fizz", "Plazz", "Buzz", "PlazzFizzDazz", "967", "Plazz", "Fizz", "PlazzBuzz", "971", "PlazzFizz", "Dazz", "Plazz", "FizzBuzz", "Plazz"]]
    ]
  end
  
end


