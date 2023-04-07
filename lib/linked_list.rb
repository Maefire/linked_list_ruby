require_relative "./node"

# Build the following methods in your linked list class:
class LinkedList
  attr_accessor :head

  def initialize
    @head = nil
  end

  # instantiates a new Node with default nil
  def new_node(value = nil, next_node = nil)
    Node.new(value, next_node)
  end

  def start_list(value)
    self.head = new_node(value)
  end

  # prepend(value) adds a new node containing value to the start of the list
  def prepend(value)
    return start_list(value) if head.nil?

    self.head = new_node(value, head)
  end

  # size returns the total number of nodes in the list
  def size(node = head, count = 1)
    return "Error: List is empty" if head.nil?
    return count if last_node?(node)

    size(node.next_node, count + 1)
  end

  # checks supplied node to see if it is the last in the list
  def last_node?(node)
    return true if node.next_node.nil?

    false
  end

  # append(value) adds a new node containing value to the end of the list
  def append(value)
    return start_list(value) if head.nil?

    tail.next_node = new_node(value)
  end

  # tail returns the last node in the list
  def tail(node = head)
    return node if last_node?(node)

    tail(node.next_node)
  end

  # at(index) returns the node at the given index
  def at(index, node = head, count = 0)
    return node if index.eql?(count)
    return nil if last_node?(node)

    at(index, node.next_node, count + 1)
  end

  # pop removes the last element from the list
  def pop
  end

  # contains?(value) returns true if the passed in value is in the list and otherwise returns false.
  def contains?(value)
  end

  # find(value) returns the index of the node containing value, or nil if not found.
  def find(value)
  end

  # to_s represent your LinkedList objects as strings, so you can print them out and preview them in the console. The format should be: ( value ) -> ( value ) -> ( value ) -> nil
  def to_s(node = head, str = "")
    return str << "#{node.value} -> nil" if last_node?(node)

    str << "#{node.value} -> "
    to_s(node.next_node, str)
  end

  # Extra Credit
  # insert_at(value, index) that inserts a new node with the provided value at the given index.

  # remove_at(index) that removes the node at the given index.

  # Extra Credit Tip: When you insert or remove a node, consider how it will affect the existing nodes. Some of the nodes will need their #next_node link updated.
end
