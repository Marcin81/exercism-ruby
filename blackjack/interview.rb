# class Fibonacci
#   attr_reader :number
#   def initialize(number)
#     @number = number
#   end
#
#   def perform
#     # return 0 if number == 0
#     # return 1 if number == 1
#
#     # (2..number).inject(0) { |prev, n| n + prev }
#     # items = [0,0].concat((2...number).to_a)
#     # zz = items[2, items.size]
#     # sum = 0
#     #[1, 2, 3, 4, 5]
#     # [0, 1, 1, 2, 3, 5,8, 13, 21] => powinno byc od zera, prev mnie podal od jedynki
#     # start = items[0...2]
#     # items = (3..number).to_a
#     # puts items
#     # [1, 2, 3, 4, 5].each_cons(2) { |cons| p cons }
#     # zz = (0..number).to_a
#     # index = 0
#     # zz.each_slice(2) do |prev, current|
#     #   puts "prev: #{prev}, current: #{current}; index: #{index}; zz[index]: #{zz[index]}"
#     #   index += 1
#     #   sum = prev + current.to_i
#     #   puts "sum: #{sum}"
#     # end
#
#     # prev = 0
#     # [2, 3, 4].inject(0) do |sum, number|
#     #   do
#     #   puts "sum: #{sum}, number: #{number} next_sum: #{number + sum}"
#     #   # puts number + sum
#     #   number + sum
#     # end
#     #
#     # n = 0
#     # [0, 0, 1, 2, 3, 4, 5].each_cons(2) do |prev, current|
#     #   puts "prev: #{prev}, current: #{current}; index: #{index}"
#     #   n += prev + current
#     # end
#
#     # prev = nil
#     # results = items.map.with_index do |n, i|
#     #   #
#     #   prev = 0 if i == 0
#     #   prev = 1 if i == 1
#     #   result = prev + n
#     #   # prev = items[i-1].to_i
#     #
#     #   puts "#{prev} + #{n} : #{result}"
#     #   prev = result
#     #   result
#     # end
#     #
#     #
#     # fibonaci = results[0, items.size-1]
#     # puts fibonaci
#     # fibonaci.last
#     # sum
#     fib = [0, 1]
#
#     (number).times do
#       fib << fib[-2] + fib[-1]
#     end
#
#     # # p fib
#     # # => [0, 1, 1, 2, 3, 5, 8, 13, 21, 34]
#     fib.last
#   end
# end
# puts Fibonacci.new(5).perform
#
#

class Fibonacci
  def initialize(n)
    @n = n
  end

  # def perform
  #   return 0 if @n == 0
  #   return 1 if @n == 1
  #
  #   prev = 0
  #   sum = 1
  #   (2..@n).each do
  #     # prev, sum = sum, prev + sum
  #     prev, sum = swap(prev, sum)
  #   end
  #
  #   sum
  # end
  def perform
    return 1 if n == 1
    return 0 if n.zero?

    Fibonacci.new(n-1).perform + Fibonacci.new(n-2).perform
  end

  private

  attr_reader :n
  # def swap(prev, sum)
  #   [sum, prev + sum]
  # end
end

puts Fibonacci.new(0).perform  # => 0
puts Fibonacci.new(1).perform  # => 1
puts Fibonacci.new(2).perform  # => 1
puts Fibonacci.new(3).perform  # => 2
puts Fibonacci.new(4).perform  # => 3
puts Fibonacci.new(5).perform  # => 5
puts Fibonacci.new(6).perform  # => 8
puts Fibonacci.new(7).perform  # => 13
puts Fibonacci.new(8).perform  # => 21
puts Fibonacci.new(9).perform  # => 34

# def fibonacci(n)
#   return 1 if n == 1
#   return 0 if n.zero?
#
#   fibonacci(n - 1) + fibonacci(n - 2)
# end

# 5 to
# [0, 1, 1, 2, 3, 5,8, 13, 21]
# 1, 2, 3, 4, 5
# np. n to 5 to
# f(4) + f(3)

# f4 to f3 + f2
# f3 to f2 + f1
# f2 to f1 + f0

# f0 => 0
# f1 => 1
# f2 => 1 + 0
# f3 => 1 + 1
# f4 => 2 + 1
# f5 => 3 + 2