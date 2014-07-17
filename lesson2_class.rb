#Module that provides a general initialize method that takes a Hash to set properties.
module GeneralInit
	def initialize(*h)
      if h.length == 1 && h.first.kind_of?(Hash)
        h.first.each { |k,v| send("#{k}=",v) }
      end
    end
end

class Product
	#Modules
	include GeneralInit

	@@statuses = [:out_of_stock, :available, :discontinued]

	#Method that uses metaprogramming to create operator methods
	attr_accessor :id, :name, :quantity, :price, :description, :status

	#Metaprogramming section.
	@@statuses.each do |status|
		define_method("is_#{status.to_s}?"){
			@status == status
		}
	end

	#Method missing part
	def method_missing(method, *args, &block)
		if method =~ /has_at_least_\d+\?/
			has_at_least(method.to_s.match(/has_at_least_(\d+)\?/)[1].to_i)
		else
			super
		end
	end

	#Equivalent to toString() in Java.
	def to_s
		"Product Id: #{id}, name "
	end

	#Define a private method
	private 
	def has_at_least(n)
		@quantity >= n
	end
end

first = Product.new({
	id: 1,
	name: "Dell Monitor",
	status: :available,
	quantity: 5
})

puts "This is a product #{first.to_s}"
puts "Is that product available? #{first.is_available?}"
puts "Is that product out of stock? #{first.is_out_of_stock?}"
puts "Do we have at least three units of this product #{first.has_at_least_3?}"
puts "Do we have at least 5 units of this product #{first.has_at_least_5?}"
puts "Do we have at least 14 units of this product #{first.has_at_least_14?}"
