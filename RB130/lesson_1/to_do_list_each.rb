# This class represents a todo item and its associated
# data: name and description. There's also a "done"
# flag to show whether this todo item is done.

class Todo
  DONE_MARKER = 'X'
  UNDONE_MARKER = ' '

  attr_accessor :title, :description, :done

  def initialize(title, description='')
    @title = title
    @description = description
    @done = false
  end

  def done!
    self.done = true
  end

  def done?
    done
  end

  def undone!
    self.done = false
  end

  def to_s
    "[#{done? ? DONE_MARKER : UNDONE_MARKER}] #{title}"
  end

  def ==(otherTodo)
    title == otherTodo.title &&
      description == otherTodo.description &&
      done == otherTodo.done
  end
end

# This class represents a collection of Todo objects.
# You can perform typical collection-oriented actions
# on a TodoList object, including iteration and selection.

class TodoList
  attr_accessor :title

  def initialize(title)
    @title = title
    @todos = []
  end

  # rest of class needs implementation

  def add(todo)
    raise TypeError, 'can only add Todo objects' unless todo.instance_of? Todo

    @todos << todo
  end

  def size
    @todos.size
  end

  def first
    @todos.first
  end

  def last
    @todos.last
  end

  def to_a
    @todos
  end

  def done?
    @todos.all? {|val| val.done?}
  end

  def item_at(index)
    @todos[index]
  end

  def mark_done_at(index)
    @todos[index].done!
  end

  def mark_undone_at(index)
    @todos[index].undone!
  end

  def done!
    @todos.each {|val| val.done!}
  end

  def shift
    remove_at(0)
  end

  def pop
    remove_at(size - 1)
  end

  def remove_at(index)
    @todos.delete_at(index)
  end 

  def to_s
    str = " ---- Today's Todos ----\n"
    @todos.each {|val| str += val.to_s + "\n"}
    str
  end

  def each
    @todos.each do |todo|
      yield(todo)
    end
    self
  end

  def select
    newtodos = TodoList.new("New List")
    @todos.each do |todo|
      newtodos.add(todo) if yield(todo)
    end
    newtodos
  end

end


todo1 = Todo.new("Buy milk")
todo2 = Todo.new("Clean room")
todo3 = Todo.new("Go to gym")

list = TodoList.new("Today's Todos")
list.add(todo1)
list.add(todo2)
list.add(todo3)

list.each do |todo|
  puts todo                   # calls Todo#to_s
end

todo1.done!

results = list.select { |todo| todo.done? }    # you need to implement this method

puts results.inspect