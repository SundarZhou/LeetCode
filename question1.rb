p "输入一数字,以, 分割"
nums = gets.split(',').map{|num| num.to_i}
p "输入一个和"
target = gets.to_i

def get_sum_num(nums, target)
	num1 = nums.find{ |num| (target - num) != num && (nums.include? target - num)}
	num2 = target - num1
	[num1, num2]
end
p get_sum_num(nums, target)