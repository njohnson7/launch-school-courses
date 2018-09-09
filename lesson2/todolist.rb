# frozen_string_literal: true

# to_do_list_final.rb

class Todo
  DONE_MARKER = 'X'
  UNDONE_MARKER = ' '

  attr_accessor :title, :description

  def initialize(title, description = '')
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

  def undone?
    !done?
  end

  def undone!
    self.done = false
  end

  def to_s
    "[#{done? ? DONE_MARKER : UNDONE_MARKER}] #{title}"
  end

  private

  attr_accessor :done
end

class TodoList
  attr_reader :title

  def initialize(title)
    @title = title
    @todos = []
  end

  def ==(other)
    todos == other.todos
  end

  def add(todo)
    check_validity(todo)
    todos << todo
    self
  end
  alias << add

  def add_at(idx, todo)
    check_validity(todo)
    check_bounds(idx)
    todos.insert(idx, todo)
    self
  end

  def all_done
    select(&:done?)
  end

  def all_not_done
    select(&:undone?)
  end

  def done!
    each(&:done!)
  end
  alias mark_all_done done!

  def done?
    todos.all?(&:done?)
  end

  def each
    return to_enum unless block_given?
    todos.each { |todo| yield(todo) }
    self
  end

  def find_by_title(todo_title)
    check_string(todo_title)
    select { |todo| todo.title =~ /#{todo_title}/i }.first
  end

  def first
    todos.first
  end

  def include?(todo)
    todos.include?(todo)
  end

  def item_at(idx)
    todos.fetch(idx)
  end

  def mark_done(todo_title)
    mark_title(todo_title, done: true)
  end

  def mark_done_at(idx)
    item_at(idx).done!
  end

  def mark_undone(todo_title)
    mark_title(todo_title, done: false)
  end

  def mark_undone_at(idx)
    item_at(idx).undone!
  end

  def last
    todos.last
  end

  def pop
    todos.pop
  end

  def remove_at(idx)
    todos.delete_at(idx) if item_at(idx)
  end

  def rename_title(str)
    check_string(str)
    self.title = str
  end

  def select
    return to_enum(:select) unless block_given?
    selected_list = TodoList.new(title)
    each { |todo| selected_list << todo if yield(todo) }
    selected_list
  end

  def shift
    todos.shift
  end

  def size
    todos.size
  end

  def to_a
    todos
  end

  def to_s
    ["---- #{title} ----", todos.map(&:to_s)].join("\n")
  end

  def undone!
    each(&:undone!)
  end
  alias mark_all_undone undone!

  def unshift(todo)
    todos.unshift(todo)
    self
  end

  def update_description(todo_title, description)
    check_string(description)
    find_by_title(todo_title).description = description
  end

  protected

  attr_reader :todos

  private

  attr_writer :title

  def check_bounds(idx)
    raise IndexError, "index #{idx} outside of list bounds" unless idx <= size
    true
  end

  def check_string(str)
    raise TypeError, "#{str} is not a String" unless str.is_a?(String)
    true
  end

  def check_validity(todo)
    raise TypeError, 'can only add Todo objects' unless todo.instance_of?(Todo)
    true
  end

  def index(item)
    todos.index(item)
  end

  def mark_title(str, done:)
    matching_idx = index(find_by_title(str))
    if matching_idx
      done ? mark_done_at(matching_idx) : mark_undone_at(matching_idx)
    else
      "No item found with '#{str}' in its title."
    end
  end
end

# todo1 = Todo.new("Buy milk")
# todo2 = Todo.new("Clean room")
# todo3 = Todo.new("Go to gym")
# list = TodoList.new("Today's Todos")

# # ---- Adding to the list -----

# # add
# p list.add(todo1)  # adds todo1 to end of list, returns list
# p list.add(todo2)  # adds todo2 to end of list, returns list
# p list.add(todo3)  # adds todo3 to end of list, returns list
# # p list.add(1)      # raises TypeError with message "Can only add Todo objects"
# puts

# # <<
# # same behavior as add
# # p list << todo1
# # p list << 1

# # ---- Interrogating the list -----

# # size
# p list.size          # returns 3
# puts

# # first
# p list.first         # returns todo1, which is the first item in the list
# puts

# # last
# p list.last          # returns todo3, which is the last item in the list
# puts

# # ---- Retrieving an item in the list ----

# # item_at
# # p list.item_at                    # raises ArgumentError
# p list.item_at(1)                 # returns 2nd item in list (zero based index)
# # p list.item_at(100)               # raises IndexError
# puts

# # ---- Marking items in the list -----

# # mark_done_at
# # p list.mark_done_at               # raises ArgumentError
# p list.mark_done_at(1)            # marks the 2nd item as done
# p list.item_at(1)
# # p list.mark_done_at(100)          # raises IndexError
# puts

# # mark_undone_at
# # p list.mark_undone_at             # raises ArgumentError
# p list.mark_undone_at(1)          # marks the 2nd item as not done,
# p list.item_at(1)
# # p list.mark_undone_at(100)        # raises IndexError
# puts
# puts

# # ---- Deleting from the the list -----

# # shift
# p shifted = list.shift                      # removes and returns the first item in list
# p list
# list.unshift(shifted)
# p list
# puts

# # pop
# p popped = list.pop                        # removes and returns the last item in list
# p list
# list << popped
# p list
# puts

# # remove_at
# # p list.remove_at                  # raises ArgumentError
# p list.remove_at(1)               # removes and returns the 2nd item
# p list
# # p list.remove_at(100)             # raises IndexError
# puts

# # ---- Outputting the list -----


# # to_s
# p list.to_s                      # returns string representation of the list
# puts
# puts list
# puts

# # ---- Today's Todos ----
# # [ ] Buy milk
# # [ ] Clean room
# # [ ] Go to gym

# # or, if any todos are done

# # ---- Today's Todos ----
# # [ ] Buy milk
# # [X] Clean room
# # [ ] Go to gym

# # add_at
# # list.add_at(4, todo1)
# # list.add_at(-10, todo1)
# # list.add_at(1, 'todo str')
# list.add_at(1, todo2)
# puts list
# puts

# list.mark_done_at(1)
# puts list
# p list.done?
# puts

# list.mark_done_at(0)
# list.mark_done_at(2)
# puts list
# p list.done?
# puts

# list.undone!
# puts list
# p list.done?
# puts

# list.done!
# puts list
# p list.done?
# puts

# p list.to_a
# puts
# puts

# list.undone!
# p list.each
# puts

# p list.each { |todo| puts todo }
# puts

# list.each(&:done!)
# puts list
# puts
# puts

# list.undone!
# list.mark_done_at(0)
# p list.select(&:done?)
# p list.select(&:undone?)
# puts

# p list.select
# puts

# p list.select { |item| puts item }
# p list.select(&:itself)
# puts
# puts

# p list.find_by_title('milk')
# p list.find_by_title('MILK')
# p list.find_by_title('clean')
# p list.find_by_title('gymm')
# puts

# p list.all_done
# p list.all_not_done
# puts
# puts

# p list.mark_done('gym')
# p list.mark_done('gy')
# p list.mark_done('gymm')
# p list.mark_done('crazy')
# puts list
# puts

# p list.mark_undone('crazy')
# p list.mark_undone('gymm')
# p list.mark_undone('gym')
# p list.mark_undone('gy')
# puts list
# puts
# puts

# list.mark_all_done
# puts list
# puts

# list.mark_all_undone
# puts list
# puts
# puts

# list.update_description('gym', 'run 50 laps')
# # list.update_description('gym', 123)
# p list.find_by_title('gym').description
# puts


# list.rename_title('New list')
# # list.rename_title(12)
# puts list
