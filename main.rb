require_relative "lib/linked_list"
require_relative "lib/node"

my_linked_list = LinkedList.new

p my_linked_list.tail
p my_linked_list.size
my_linked_list.start_list("3")
p my_linked_list.size
my_linked_list.prepend("2")
my_linked_list.prepend("1")
my_linked_list.prepend("0")
puts my_linked_list
my_linked_list.append("node is originally after 3")
puts my_linked_list
my_linked_list.append("node is last node")
p my_linked_list.at(4).value
p my_linked_list.at(6)
p my_linked_list.find("node is last node")
p my_linked_list.contains?("node is originally 6")
puts my_linked_list
p my_linked_list.tail.value
my_linked_list.pop
puts my_linked_list
p my_linked_list.contains?("node is originally after 3")
my_linked_list.insert_at("inserted value", 4)
puts my_linked_list
my_linked_list.remove_at(0)
puts my_linked_list
