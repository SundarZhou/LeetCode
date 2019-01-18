require 'benchmark'

p "按提示操作，你将得到符合条件的两个数值的下标"
p "输入一数字,以, 分割"
nums = gets.split(',').map{|num| num.to_i}
p "输入一个和"
target = gets.to_i

def get_sum_num(nums, target)
	num1 = nums.find{ |num| (target - num) != num && (nums.include? target - num)}
	if num1
		num2 = target - num1
		index1 = nums.index num1
		index2 = nums.index num2
		[index1, index2]
	else
		"没有任何两个数值符合条件"
	end
end




# 大部分的思路是将数组转化为一个hash,num为key，下标为value
# 遍历得到符合符合条件的两个数值，并且通过 hash 找到下标
# ruby 有index的方法可以直接找到下标，所以直接遍历得到两个数值并且执行 find index 即可
# 至于哪个方法执行得更快， 请原谅我学艺不精，这里只能通过对比时间来给出结果了

# 方法来至 https://ruby-china.org/topics/26529，所有时间  80ms
# 我查查如何对比两个方法哪个更快更好
# 他原本的方法 + 1 ，不明白为什么要这样做，但是 + 1后是错的
def two_sum(numbers, target)
    hash = numbers.map.with_index.to_h
    found = numbers.find.with_index do |n, index|
      target_index = hash[target - n] and target_index != index
    end
    if found
      [numbers.index(found), hash[target - found]].sort
    else
    	"没有任何两个数值符合条件"
    end
end
t1 = Time.now
p get_sum_num(nums, target)
t1_end = Time.now
p " get_sum_num 使用时间 #{t1_end - t1}"
t2 = Time.now
p two_sum(nums, target)
t2_end = Time.now
p "two_sum 使用时间 #{t2_end - t1}"

if t2_end < t1_end
	"two_sum 更快"
elsif t2_end < t1_end
  "get_sum_num 更快"
else
  "几乎不可能得一样快了"
end
