#Classic Hello World
#No semicolon needed!
puts "Hello World!"

#numbers are objects too
puts 5.to_s

#You can know an object's class easily
puts 5.class

#You can also check for an object's class
puts 5.is_a?(Fixnum)

#even nil is an object too!
#Double quotes allow embedding ruby expressions.
puts "Is nil nil?: #{nil.nil?}"

#objects and hashes can be instantiated literally.  More on these objects later.
foo = {
  bar: 1
}
bar = ['foo']

#Functions always return the last thing that was executed, even if it's just an statement
def something
  "foo"
end

#Parenthesis aren't necessary with Ruby's syntax to invoke a method/function.
puts something

#You can return two or more values.
def repeat(foo, bar)
  return foo, bar
end

one, two = repeat("one", "two")

puts "#{one}#{two}"

#Ruby supports symbols, which are strings that always point to the memory region.
symbol = :symbol

#They are quite useful to retrieve objects from hashes.  Again, more on hashes later.
puts foo[:bar]

#Strings have a lot of built in functionality.
hello = 'hello'

puts hello.upcase

puts hello[1,3]

puts hello.reverse

#If/else.  Ruby also supports an elsif construct
if something
  puts "Something is true!"
else
  puts "Should this happen, something is false!"
end

if false
  #nothing
elsif true
  puts "Yes, true is true!"
else
end

#Ruby also has the unless keyword, which works as a negated if.  It's a bit weird initially, but once you get used to it, it's quite readable.
unless something.nil?
  puts "Something is not nil, then print this!"
end

#Unless and if can also be appended to lines, which is, allegedly, more readable.  The ruby style guide recommends it.
puts "This will always be printed!" unless something.nil?

#Ruby's switch
case Random.new.rand(0..9)
when 1
  puts "We got a 1!"
when 2
  puts "This it it's 2!"
else
  puts "Everything else!"
end

#While.  #Similar to unless, Ruby supports until, which is a negated while.
i = 0
while i < 10
  puts "While: #{i}"
  i+=1
end

i = 0
until i ==5
  puts "Until: #{i}"
  i+=1
end

#For.  This uses a Range, more on Ranges later.
for i in (1..5)
  puts "For: #{i}"
end

#Probably the most Rubyish way to iterate is with blocks, though.  More on blocks later, but here are some examples.
[1,2,3,4,5].each do |i|
  puts "This is a block, and this time I got #{i}"
end

3.times {|i| puts "This is hello number #{i+1}"}

#Hashes get key/value iterations.
{a:1, b:2, c:3}.each do |key, value|
  puts "This is a hash, and for key #{key}, I got value #{value}."
end

#Some operators.  "and" and "or" can be used, but have lower precedence than && and ||
#If and unless statements can be used after a statement like this
puts "Never!" if true && false
puts "Always!" unless false || false 

#The ||= operator basically initializes to the argument if the variable is nil
test ||= "test"
puts test

#<=> is another interesting operator, which is frequently used by sort operations.
puts "abc".upcase <=> "cba".upcase

#Constants are written in uppercase.
CONST = 1

#But take care, they can be modified!
CONST1 = 2