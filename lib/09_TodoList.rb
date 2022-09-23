class TodoList
  def initialize
    @all_tasks = []
    @incomplete = []
    @complete = []

  end

  def add(todo)
    @all_tasks << todo
  end

  def complete
    @all_tasks.map do |task|
      if task.done?
        @complete.push(task)
      end
    end
    return @complete
  end

  def incomplete
    @all_tasks.map do |task|
      if !task.done?
        @incomplete.push(task)
      end
    end
    return @incomplete
  end
end
