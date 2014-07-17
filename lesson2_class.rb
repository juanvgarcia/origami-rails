module GeneralInit
	def initialize(*h)
    if h.length == 1 && h.first.kind_of?(Hash)
      h.first.each { |k,v| send("#{k}=",v) }
    end
  end
end

class Product
	include GeneralInit

	@@statuses = [:out_of_stock, :available, :discontinued]

	attr_accessor :id, :name, :quantity, :price, :description, :status

	@@statuses.each do |status|
		define_method("is_#{status.to_s}?"){
			@status == status
		}
	end

	def method_missing(method, *args, &block)
		if method =~ /has_at_least_\d+\?/
			@quantity >= method.to_s.match(/has_at_least_(\d+)\?/)[1].to_i
		else
			super
		end
	end

	def to_s
		"Product Id: #{id}, name "
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
