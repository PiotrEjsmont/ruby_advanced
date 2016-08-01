def bubble_sort(array)
array.size.times do
	array.each_with_index do |element, index|
		if index > 0
			x = element
			if element < array[index-1]
				array[index] = array[index-1]
				array[index-1] = x
			end
		end
	end
end
puts array.join(", ")
end
bubble_sort([4,3,78,2,0,2])

def bubble_sort_by(array)
	array.size.times do
		array.each_with_index do |element, index|
			if index > 0
				x = element
				if yield(array[index-1], element) > 0
					array[index] = array[index-1]
					array[index-1] = x
				end
			end
		end
	end
	puts array.join(", ")
end
bubble_sort_by(["hi", "hello", "hey"]) { |left, right| left.length - right.length }
