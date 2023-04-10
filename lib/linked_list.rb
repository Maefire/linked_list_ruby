require_relative "./node"

# Build the following methods in your linked list class:
class LinkedList
  attr_accessor :head

  def initialize
    @head = nil
  end

  # instantiates a new Node
  def new_node(value = nil, next_node = nil)
    Node.new(value, next_node)
  end

  def start_list(value)
    self.head = new_node(value)
  end

  # prepend(value) adds a new node containing value to the start of the list
  def prepend(value)
    return start_list(value) if head.nil?

    new_head(value)
  end

  # size returns the total number of nodes in the list
  def size(node = head, count = 1)
    return "Error: List is empty" if head.nil?
    return count if last_node?(node)

    size(node.next_node, count + 1)
  end

  # checks supplied node to see if it is the last in the list
  def last_node?(node)
    !node.next_node
  end

  # tail returns the last node in the list
  def tail(node = head)
    return "Error: List is empty" if head.nil?
    return node if last_node?(node)

    tail(node.next_node)
  end

  # append(value) adds a new node containing value to the end of the list
  def append(value)
    return start_list(value) if head.nil?

    tail.next_node = new_node(value)
  end

  # at(index) returns the node at the given index
  def at(index, node = head, count = 0)
    return node if index.eql?(count)
    return nil if last_node?(node)

    at(index, node.next_node, count + 1)
  end

  # pop removes the last element from the list
  def pop(node = head)
    return "Error: List is empty" if head.nil?
    return node.next_node = nil if last_node?(node.next_node)

    pop(node.next_node)
  end

  # contains?(value) returns true if the passed in value is in the list and otherwise returns false.
  def contains?(value, node = head)
    return true if node.value.eql?(value)
    return false if last_node?(node)

    contains?(value, node.next_node)
  end

  # find(value) returns the index of the node containing value, or nil if not found.
  def find(value, node = head, index = 0)
    return index if node.value.eql?(value)
    return nil if last_node?(node)

    find(value, node.next_node, index + 1)
  end

  # to_s represent your LinkedList objects as strings, so you can print them out and preview them in the console. The format should be: ( value ) -> ( value ) -> ( value ) -> nil
  def to_s(node = head, str = "")
    return str << "#{node.value} -> nil" if last_node?(node)

    str << "#{node.value} -> "
    to_s(node.next_node, str)
  end

  # Extra Credit
  # insert_at(value, index) that inserts a new node with the provided value at the given index.
  def insert_at(value, index, count = 0)
    return new_head(value) if index.zero?

    return at(index - 1).next_node = new_node(value, at(index)) if index.eql?(count)

    insert_at(value, index, count + 1)
  end

  def new_head(value)
    self.head = new_node(value, head)
  end

  # remove_at(index) that removes the node at the given index.
  def remove_at(index, count = 0)
    return self.head = head.next_node if index.zero?
    return at(index - 1).next_node = at(index + 1) if index.eql?(count)

    remove_at(index, count + 1)
  end
  # Extra Credit Tip: When you insert or remove a node, consider how it will affect the existing nodes. Some of the nodes will need their #next_node link updated.
end
