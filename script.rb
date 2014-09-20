module Enumerable
	def my_each
		if block_given?
			i = 0
			while i < self.size
				yield(self[i])
				i += 1
			end
		end
		self
	end

	
	def my_each_with_index 
		if block_given?
			i = 0 
			while i < self.size
				yield(self[i],i)
				i += 1
			end
		end
		self
	end
	
	def my_select
		if block_given?
			result = []
			self.my_each do |elem|
				if yield(elem)
					result.push(elem)
				end
			end
			result
		else
			self
		end
	end
	
	def my_all?
		if block_given?
			for i in self
				return false unless yield(i)
			end
		else 
			return false if (self.include?(false) || self.include?(nil))
		end
		true
	end
	
	def my_any?
		if block_given?
			for i in self
				return true if yield(i)
			end
		else
			return false unless self.include?(true)
		end
		true
	end
	
	def my_none?
		if block_given?
			for i in self
				return false if yield(i)
			end
		else
			return false if self.include?(true)
		end
		true
	end
	
	def my_count(arg = nil)
		count = 0
		self.my_each do |num|
			if block_given?
				count +=1 if yield(num)
			elsif arg != nil 
				count += 1 if num == arg
			else 
				count += 1
			end
		end
		count
	end

	def my_map(&block)
		if block_given?
			result = []
			self.my_each do |elem|
				result.push(block.call(elem))
			end
			return result
		else 
			self
		end
	end

	def my_inject(initial)
		return self unless block_given?
		self.my_each do |x|
			initial = yield(initial,x)
		end
		return initial
	end

	
end

class Array
	include Enumerable
end
def multiply_els(a)
	result = a.my_inject(1) { |result, num| num * result }
	return result
end