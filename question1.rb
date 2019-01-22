require 'benchmark'

p "按提示操作，你将得到符合条件的两个数值的下标"
p "输入一数字,以, 分割"
nums = gets.split(',').map{|num| num.to_i}
p "输入一个和"
target = gets.to_i

def get_sum_num(nums, target)
	num1 = nums.find{ |num| (nums.include? target - num) && (num == target - num ? (nums.each_index.select{|i| nums[i] == num}.size > 1) : true })}
	if num1
		num2 = target - num1
    if num1 == num2
      nums.each_index.select{|i| nums[i] == num1}[0..1]
    else
  		index1 = nums.index num1
  		index2 = nums.index num2
  		[index1, index2]
    end
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
def two_sum(nums, target)
    hash = nums.map.with_index.to_h
    found = nums.find.with_index do |n, index|
      target_index = hash[target - n] and target_index != index
    end
    if found
      [nums.index(found), hash[target - found]].sort
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
	p "two_sum 更快"
elsif t2_end > t1_end
  p "get_sum_num 更快"
else
  p "几乎不可能得一样快了"
end
# 加上了考虑 数组有重复元素的情况，不创建hash的方法慢了很多
#https://leetcode-cn.com/problems/two-sum/submissions/ 可以在这个网站运行查看时间

#大佬的方法
#把另一个数作为key，然后把当前这个值的下标做为value,继续往下，另一个值作为key了所以已经有满足条件的两个数字时，返回当前的index与另一个的value
def num_targets(nums, target)
  tmp = {}
  nums.each_with_index do |el, idx|
    if tmp[el].nil?
      tmp[target - el] = idx
    else
      return [tmp[el], idx]
    end
  end
end