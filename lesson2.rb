#Arrays can be instantiated easily
array = []

#You can also use a longer notation
array = Array.new

#You can also put all sorts of objects in them.
other_array = [1, "2", 3.0, [4], 5.times, Proc.new {puts "Hello World!"} ]

puts other_array

#Since every array is an object, you can execute a lot of built-in methods.
['a', 'b', 'c'].sample  #Random element

[1,2,3].shuffle #Randomize array.

puts other_array[2] #indexing

puts other_array[-1] #you can also use negative indexes.

puts other_array[1,3] #or slicing.

#The array class conveniently offers some operators
costa_rican_flag = ['red', 'blue', 'white']
hungarian_flag = ['red', 'white', 'green']

puts "The Costa Rican colors missing in the Hungarian flag are: #{(costa_rican_flag - hungarian_flag)}."
puts "The colors present in both Costa Rican and Hungarian flags are #{(costa_rican_flag & hungarian_flag)}."

#As we saw before, we can check the tyep of things to make sure they're arrays
puts "Yay! Other array is an array." if other_array.is_a?(Array)

#On to hashes, they can also be instantiated quite easily.

sports = {
  costa_rica: 'soccer',
  usa: 'american_football',
  india: 'cricket',
  canada: 'hockey'
}

#Symbols are used frequently as keys, since that lowers memory footprint.
puts "The most played sport in Costa Rica is: #{sports[:costa_rica]}"

#Be careful since symbols are not quite the same as strings.
puts "The most popular sport in the USA is: #{sports['usa']}" #Incomplete output!

#Hashes also have a lot of built in functionality.
puts "The sports in the sports hash are #{sports.values}, and the countries are #{sports.keys}."

puts "Adding more sports! #{sports.merge!({new_zealand:'rugby'})}"

#A lot of time we'll want to iterate or perform other operations through all the Hash or Array.
#In Ruby, this is usually done with blocks.
#A block is pretty much an anonymous function.

ingredients = ['cheese', 'sauce', 'mushrooms', 'peppers', 'garlic']

ingredients.each {|ingredient| puts "We need #{ingredient} to make a great pizza."}

#Other operations are possible, we can also chain them.
ingredients.map {|ingredient| "a lot of " + ingredient}.each {|ingredient| puts "We need #{ingredient} to make a great pizza." }

puts "To make a not so great pizza we need #{ingredients.select {|ingredient| ingredient.length > 5} }"

#This syntax would is better suited for more complex operations
ingredients.each do |ingredient|
  #Do stuff here.
  ingredient.to_s
  ingredient.hash
  ingredient.slice(3)
  ingredient.class
end

#We can also use blocks with hashes.
ingredients_list = {
  cheese: '1kg',
  sauce: '1lt',
  mushrooms: '0.5kg',
  peppers: '0.25kg',
  garlic: '0.05kg'
}

puts "To make a great pizza we need:"

ingredients_list.each { |ingredient, quantity| puts "#{quantity} of #{ingredient}" }

#Ruby also has functional features.  Blocks are pretty much anonymous functions, but we can also use Procs like this:
hello_world = Proc.new { puts "Hello World" }

#Since we can "store" functions as variables, we can reuse then if needed.
#The ampersand operator turns Procs into blocks, which are expected by some Ruby methods.
5.times &hello_world

#We can also have functions that expect functions as parameters.
def print_after_f(f, arr)
  arr.each{|i| puts f.call(i)}
end

square = Proc.new {|n| n**2}

print_after_f(square, [1,2,3])

#We can also define methods that use blocks.
def iterate!(array)
  array.each_with_index {|n,i| array[i] = yield(n)}
end

puts iterate!([1,2,3]){ |x| x**2 }

#Print the English letters using a Range.
('a'..'z').each {|letter| print "#{letter} "}
puts