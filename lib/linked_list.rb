class Node
  attr_accessor :value, :next_node

  def initialize(value = nil)
    @value = value
    @next_node = nil
  end
end

class LinkedList
  def initialize
    @head = nil
  end

  def append(value)
    if @head
      tail.next_node = Node.new(value)
    else
      @head = Node.new(value)
    end
  end

  def prepend(value)
    new_node = Node.new(value)
    new_node.next_node = @head
    @head = new_node
  end

  def head
    @head
  end

  def tail
    node = @head
    return node unless node.next_node

    return node unless node.next_node while (node = node.next_node)
  end

  def at(index)
    node = @head
    return node if index == 0
    index.times do |i|
      node = node.next_node
    end
  end

  def size
    count = 0
    node = @head

    while node
      count += 1
      node = node.next_node
    end

    return count
  end

  def contains?(value)
    node = @head

    return false unless node

    while node
      return true if node.value == value
      node = node.next_node
    end

    false
  end

  def list_all
    node = @head

    while node

      if node == tail
        "#{node.value}"
        "end"
      else
        "#{node.value}"
      end

      node = node.next_node
    end

  end

end
