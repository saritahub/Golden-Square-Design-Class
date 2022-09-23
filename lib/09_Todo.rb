class Todo
  def initialize(task) # task is a string
    @all_tasks = []
    @all_tasks << task
    @done = false
  end

  def task
    @all_tasks
  end

  def mark_done!
    @done = true
  end

  def done?
    @done
  end
end