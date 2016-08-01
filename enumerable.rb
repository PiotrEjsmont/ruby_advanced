module Enumerable
	def my_each
		for i in 0...self.size
			yield(self[i])
		end
	end
	def my_each_with_index
		for i in 0...self.size
			yield(self[i], i)
		end
	end
	def my_select
		self.my_each do |i|
			puts i if yield(i) == true
		end
	end
	def my_all?
		f = []
		self.my_each do |i|
			if yield(i) == false
				f << i
			end
		end
		if f.size == 0
			puts true
		else
			puts false
		end
	end
	def my_any?
		t = []
		self.my_each do |i|
			if yield(i) == true
				t << i
			end
		end
		if t.size == 0
			puts false
		else
			puts true
		end
	end
	def my_none?
		n = []
		self.my_each do |i|
			if yield(i) == true
				n << i
			end
		end
		if n.size == 0
			puts true
		else
			puts false
		end
	end
	def my_count(var=nil)
		if block_given?
			blo = 0
			self.my_select do |i|
				blo += 1 if yield(i) == true
			end
			puts blo
		elsif var != nil
			arr = 0
			self.my_select do |i|
				if i == var
					arr += 1
				end
			end
			puts arr
		else
			puts self.size
		end
	end
	def my_map(proc=nil)
		arr = []
		if block_given?
			self.my_each do |i|
				arr << yield(i)
			end
		elsif proc
			self.my_each do |i|
				arr << proc.call(i)
			end
		end
		puts arr
	end
	def my_inject(var=nil)
		self.my_each do |i|
			var = yield(var, i)
		end
		puts var
	end
	
end
def multiply_els(array)
	array.my_inject(1) {|running, item| running*item}
end
[1,2,3].my_each {|number| puts number}
puts
[1,2,3].my_each_with_index {|number, index| puts number*2 if index > 0}
puts
[1,2,3].my_select {|number| number > 1}
puts
[1,2,3].my_all? {|number| number > 0}
puts
[1,2,3].my_any? {|number| number > 2}
puts
[1,2,3].my_none? {|number| number > 1}
puts
[1,2,3].my_count(2)
puts
[1,2,3].my_map {|number| "#{number}!"}
puts
my_proc = Proc.new {|number| "#{number}!"}
[1,2,3].my_map(&my_proc)
puts
[1,2,3].my_inject(2) {|running, item| running * item}
puts
multiply_els([2,4,5])
