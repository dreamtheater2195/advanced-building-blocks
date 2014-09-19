a = [4,3,78,2,0,2]
def bubble_sort(arr)
	i = 0
	while i < arr.size - 1
		j = 0
		while j < arr.size - i - 1
			if arr[j] > arr[j+1]
				temp = arr[j]
				arr[j] = arr[j+1]
				arr[j+1] = temp
			end
			j += 1
		end
		i += 1
	end
	puts arr
end
puts "Normal bubble sort"
bubble_sort(a)

def bubble_sort_by(arr)
	i = 0
	while i < arr.size - 1
		j = 0
		while j < arr.size - i - 1
			if yield(arr[j],arr[j+1]) < 0
				temp = arr[j]
				arr[j] = arr[j+1]
				arr[j+1] = temp
			end
			j += 1
		end
		i += 1
	end
	puts arr
end
puts "Advanced bubble_sort"
bubble_sort_by(["hi","hello","hey"]) do |left,right|
    right.length - left.length
end