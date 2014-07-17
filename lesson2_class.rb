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

puts first.to_s
puts first.is_available?
puts first.is_out_of_stock?
puts first.has_at_least_3?
puts first.has_at_least_5?
puts first.has_at_least_14?
