#Classic Hello
puts "Hello World!"

#numbers are objects to
puts 5.to_s

#even nil is an object too!
puts "Is nil nil?: #{nil.nil?}"

#objects and hashes can be instantiated literally.  More on this objects later.
foo = {
  bar: 1
}
bar = ['foo']

#Functions always return the last thing that was executed, even if it's just an statement
def something
  "foo"
end

puts something

#You can return two or more values.
def two_somethings
  return "foo", "bar"
end

foo, bar = two_somethings

puts "#{foo}#{bar}"
