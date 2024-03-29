require 'simplecov'
SimpleCov.start

require 'minitest/autorun'
require "minitest/reporters"
Minitest::Reporters.use!

require_relative 'to_do_list'

class TodoListTest < Minitest::Test

  def setup
    @todo1 = Todo.new("Buy milk")
    @todo2 = Todo.new("Clean room")
    @todo3 = Todo.new("Go to gym")
    @todos = [@todo1, @todo2, @todo3]

    @list = TodoList.new("Today's Todos")
    @list.add(@todo1)
    @list.add(@todo2)
    @list.add(@todo3)
  end

  # Your tests go here. Remember they must start with "test_"

  def test_to_a
    assert_equal(@todos, @list.to_a)
  end

  def test_size
    assert_equal(3, @list.size)
  end

  def test_first
    assert_equal(@todo1, @list.first)
  end

  def test_last
    assert_equal(@todo3, @list.last)
  end

  def test_shift
    todo = @list.shift
    assert_equal(@todo1, todo)
    assert_equal([@todo2, @todo3], @list.to_a)
  end

  def test_pop
    todo = @list.pop
    assert_equal(@todo3, todo)
    assert_equal([@todo1, @todo2], @list.to_a)
  end

  def test_done_question
    assert_equal(false, @list.done?)
  end

  def test_type_error
    assert_raises(TypeError) { @list.add(1)}
    assert_raises(TypeError) { @list.add('yo')}
  end

  def test_shovel
    new_todo = Todo.new("Walk the dog")
    @list << new_todo
    @todos << new_todo
    assert_equal(@todos, @list.to_a)
  end

  def test_add
    new_todo = Todo.new("Walk the dog")
    @list.add(new_todo)
    @todos << new_todo
    assert_equal(@todos, @list.to_a)
  end

  def test_item_at
    assert_equal(@todo2, @list.item_at(1))
    assert_raises(IndexError) { @list.item_at(6)}
  end

  def test_mark_done_at
    @list.mark_done_at(1)

    assert_equal(true, @todo2.done?)
    assert_raises(IndexError) { @list.mark_done_at(6)}
  end

  def test_mark_undone_at

    @list.mark_done_at(1)
    @list.mark_undone_at(1)

    assert_equal(false, @todo2.done?)
    assert_raises(IndexError) { @list.mark_done_at(6)}

  end

  def test_done_bang
    @list.done!

    assert_equal(true, @list.done?)

  end

  def test_remove_at
    assert_raises(IndexError) { @list.remove_at(50) }
    @list.remove_at(1)

    assert_equal([@todo1, @todo3], @list.to_a)

  end

  def test_to_s
    output = <<~OUTPUT
     ---- Today's Todos ----
    [ ] Buy milk
    [ ] Clean room
    [ ] Go to gym
    OUTPUT

    assert_equal(output, @list.to_s)
  end

  def test_to_s_one_done
    output = <<~OUTPUT
     ---- Today's Todos ----
    [ ] Buy milk
    [X] Clean room
    [ ] Go to gym
    OUTPUT

    @list.mark_done_at(1)
    assert_equal(output, @list.to_s)
  end

  def test_to_s_all_done
    @list.done!

    output = <<~OUTPUT
     ---- Today's Todos ----
    [X] Buy milk
    [X] Clean room
    [X] Go to gym
    OUTPUT

    assert_equal(output, @list.to_s)
  end

  def test_each
    count = 0
    @list.each {|todo| count += 1}
    assert_equal(3, count)
  end

  def test_each_return
    ret = @list.each {|todo| }
    assert_same(ret, @list)
  end

  def test_select
    @todo1.done!
    list = TodoList.new(@list.title)
    list.add(@todo1)

    assert_equal(list.title, @list.title)
    assert_equal(list.to_s, @list.select{ |todo| todo.done? }.to_s)
  end

end