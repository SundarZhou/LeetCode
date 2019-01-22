# 2. 两数相加
# 给定两个非空链表来表示两个非负整数。位数按照逆序方式存储，它们每个节点只存储单个数字。将丙数相加返回一个新的链表
# 示例
# 输入 ：(2->4->3) + (5->6->4)
# 输出 ：7->0->8
# 因为 342+465=807
p "按提示操作，你将得到符合条件的两个数值的下标"
p "输入第一个数字,以 -> 分割"
num1 = gets

p "输入第二个数字,以 -> 分割"
num2 = gets

def get_new_num num1, num2
  num1 = num1.rstrip.split('->').reverse.join().to_i
  num2 = num2.rstrip.split('->').reverse.join().to_i
  (num1+num2).to_s.reverse.split("").join('->')
end



p get_new_num(num1, num2)