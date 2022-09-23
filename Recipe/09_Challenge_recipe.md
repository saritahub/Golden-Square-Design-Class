# {{PROBLEM}} Multi-Class Planned Design Recipe

## 1. Describe the Problem

#### PART ONE
- As a user
- So that I can record my experiences 
- I want to keep a regular diary

#### Nouns
- Diary

#### Verbs
- Record experiences (make a diary entry)

------

#### PART TWO
- As a user 
- So that I can reflect on my experiences 
- I want to read my past diary entries

#### Nouns
- Diary

#### Verbs
- Read past diary entries 

------

#### PART THREE
- As a user 
- So that I can reflect on my experiences in my busy day 
- I want to select diary entries to read based on how much time I have and my reading speed

#### Nouns
- Diary

#### Verbs
- Select past diary entries based on
  - Amount of time
  - Reading speed 

------

#### PART FOUR
- As a user 
- So that I can keep track of my tasks 
- I want to keep a todo list along with my diary

#### Nouns
- Tasks 
- Todo List
- Diary 

#### Verbs

-----

#### PART FIVE
- As a user 
- So that I can keep track of my contacts 
- I want to see a list of all of the mobile phone numbers in all my diary entries

#### Nouns
- Contact mobile phone numbers
- Diary entry 

#### Verbs
- See list of mobile phone number IN diary entry 

-----

## 2. Design the Class System

### Merging user stories into Classes
- Part one, two and three could be one class, Diary
  - Maybe split this into two Classes? (Check previous Diary)
- Part four (Todo list) could be a separate Class, Todolist 
  - Maybe split this into two Classes? (Check previous Todo list)
- Part five (Contacts) could either be
  - A separate Class BUT
  - As this is linked to the diary entries, add this to the Diary class 
  - Extract phone numbers from entries (Check previous Phone Number)

### Classes
**1. Diary**

**Diary objectives** 
- Make a diary entry (Part One) 
  - METHODS: 
  1. DiaryPhone Class: initalize with an empty array for diary entries (also phone numbers, see below)
  2. DiaryPhone Class: add(entry) (a diary entry, and push it into the empty array)
- Read all diary entries (Part Two)
  - METHODS:
  1. Diary Class: read (returns all diary entries)
- Select diary entries based on amount of time and reading speed
  - METHODS:
  1. DiaryPhoneEntry Class: initialize(title, contents)
  2. DiaryPhoneEntry Class: count_words (counts the number of words in the entry)
  3. DiaryPhone Class: count_words (returns total number of words in all diary entries)
  4. DiaryPhone Class: reading_time(wpm) (returns reading time integer in minutes)
  5. DiaryPhone Class: find_best_entry_for_reading_time(wpm, minutes)  (returns the best entry based on wpm, minutes and the diary entries)


**Phone number objectives**
- Add phone numbers within diary entry
  - METHODS:
  1. initialize (same as diary entry, has a separate array to store the phone numbers) 
- Extract phone numbers into a list (view previous)
  - METHODS:
  1. extract_numbers(numbers) (extracts phone numbers from the diary entries)
  2. list_numbers   (lists phone numbers from the diary entries)

**2. Todo List**

  - Todo // TodoList 
- 'Harder' approach: link this with the Diary, so they can call the Todo list entries and Diary?? 
- 'Simpler' approach: Create separate ToDo and TodoList Classes as before

- "I want to keep a todo list along with my diary"
  - METHODS:

**Todo Class:**
1. initialize(task)  (empty array to store tasks in, task pushed into array and marked as incomplete)
2. task (returns all tasks)
3. mark_done (marks all tasks as done)
4. done? (Returns whether the task is complete or not)

**TodoList Class:**
1. initialize (empty array for all_tasks, completed and incompleted)
2. add(todo) (adds todo to the all_tasks array)
3. complete (checks if todo is complete, and returns completed items)
4. incomplete (checks if todo is not complete, and returns incomplete items)




**3. _Phone Number (optional, could be merged into Diary)_**
- As the User story wants to see the mobile numbers IN their diary entries, this will be initially merged into Diary Class
- If this causes complications, create a separate Class

_Consider diagramming out the classes and their relationships. Take care to
focus on the details you see as important, not everything. The diagram below
uses asciiflow.com but you could also use excalidraw.com, draw.io, or miro.com_

```
          ┌─────────────────────────────────────────────────┐
          │   DiaryPhone     (Class)                        │                ┌──────────────────────────────────┐
          │   --------                                      │                │   TodoList (Class)               │
          │   Methods                                       │                │   --------                       │
          │   - initialize                                  │                │   Methods                        │
          │   - add(entry)                                  │                │   - initialize                   │
          │   - all                                         │                │   - add(todo)                    │
          │   - count_words                                 │                │   - complete                     │
          │   - reading_time(wpm)                           │                │   - incomplete                   │
          │   - find_best_entry_for_reading_time(wpm, mins) │                │                                  │
          │   - extract_numbers(numbers)                    │                │                                  │
          │   - list_numbers                                │                │                                  │
          └─────────────┬───────────────────────────────────┘                └─────────────┬────────────────────┘
                        │                                                                  │
                        │                                                                  │
                        │                                                                  │
                        │                                                                  │
                        │                                                                  │
          ┌─────────────┴───────────────────┐                                              │
          │  DiaryPhoneEntry  (Class)       │                                ┌─────────────┴───────────────────┐
          │  --------                       │                                │  Todo  (Class)                  │
          │  Methods                        │                                │  --------                       │
          │  - initialize(title, contents)  ├────────────────────────────────┤  Methods                        │
          │  - count_words                  │                                │  - initialize(task)             │
          │                                 │                                │  - task                         │
          │                                 │                                │  - mark_done!                   │
          │                                 │                                │  - done?                        │
          │                                 │                                │                                 │
          │                                 │                                │                                 │
          └─────────────────────────────────┘                                │                                 │
                                                                             └─────────────────────────────────┘













```

```ruby
class DiaryPhone
  def initialize
  end

  def add(entry) #Instance of DiaryPhoneEntry
    #Returns nothing
  end

  def all
    #Returns a list of instances
  end

  def count_words
    #Returns the number of words in all diaryphoneentries 
    # To keep this simple, it will include the count of phone numbers
  end

  def reading_time(wpm)
    #Returns integer representing an estimate of the reading time in minutes
    # if the user were to read all entries in the diary.
  end

  def find_best_entry_for_reading_time(wpm, minutes)
    # `wpm` is an integer representing the number of words the user can read
    # per minute.
    # `minutes` is an integer representing the number of minutes the user
    # has to read.
    # Returns an instance of diary entry representing the entry that is closest 
    # to, but not over, the length that the user could read in the minutes they
    # have available given their reading speed.
  end
  #Phone number methods
  def extract_numbers(numbers)
  end
  
end 

  class DiaryPhoneEntry
    def initialize(title, contents) # title, contents are strings
      # ...
    end

    def count_words
      # Returns the number of words in the contents as an integer
    end

    def reading_time(wpm) # wpm is an integer representing
      # the number of words the user can read per minute
      # Returns an integer representing an estimate of the reading time in minutes
      # for the contents at the given wpm.
    end

    def reading_chunk(wpm, minutes) # `wpm` is an integer representing the number
      # of words the user can read per minute
      # `minutes` is an integer representing the
      # number of minutes the user has to read
      # Returns a string with a chunk of the contents that the user could read
      # in the given number of minutes.
      # If called again, `reading_chunk` should return the next chunk, skipping
      # what has already been read, until the contents is fully read.
      # The next call after that it should restart from the beginning.
    end
  end

  class TodoList
    def initialize
    end

    def add(todo) # todo is an instance of Todo
      # Returns nothing
    end

    def complete
      # Returns all complete todos
    end

    def incomplete
      # Returns all non-done todos
    end
  end


  class Todo
    def initialize(task) # task is a string
      # ...
    end

    def task
      # Returns the task as a string
    end

    def mark_done!
      # Marks the todo as done
      # Returns nothing
    end

    def done?
      # Returns true if the task is done
      # Otherwise, false
    end
  end

```

## 3. Create Examples as Integration Tests

_Create examples of the classes being used together in different situations and
combinations that reflect the ways in which the system will be used._

```ruby
#1 
# As a user
# So that I can reflect on my experiences
# I want to read my past diary entries
# Add 2 diary entries and return these

diaryphone = DiaryPhone.new
diaryphone_entry = DiaryPhoneEntry.new("title", "contents")
diaryphone.add("task one")
diaryphone.add("task two")
expect(diaryphone.all).to eq ["task one", "task two"]

#2 
# As a user
# So that I can reflect on my experiences in my busy day
# I want to select diary entries to read based on 
# how much time I have and my reading speed
diaryphone = DiaryPhone.new
diaryphone_entry = DiaryPhoneEntry.new("title", "contents")
diaryphone.add("task one " * 10)
diaryphone.add("task two " * 3)
diaryphone.reading_time(5)
result = diaryphone.find_best_entry_for_reading_time(5, 1)
expect(result).to eq "task two task two task"


#3 
# As a user
# So that I can keep track of my tasks
# I want to keep a todo list along with my diary
# Returns incomplete tasks 
todo_list = TodoList.new
todo_1 = Todo.new("Task")
todo_list.add(todo_1)
result = todo_list.incomplete
expect(result).to eq [todo_1]

# 4
#Returns one completed task when multiple tasks entered
todo_list = TodoList.new
todo_1 = Todo.new("Task")
todo_2 = Todo.new("Second task")
todo_list.add(todo_1)
todo_list.add(todo_2)
todo_1.mark_done!
result = todo_list.complete 
expect(result).to eq [todo_1]







```

## 4. Create Examples as Unit Tests

_Create examples, where appropriate, of the behaviour of each relevant class at
a more granular level of detail._

```ruby

#1 # Uses the DiaryPhoneEntry Class
# So that I can keep track of my contacts
# I want to see a list of all of the mobile phone numbers 
# in all my diary entries

diaryphone = DiaryPhone.new
diaryphone_entry = DiaryPhoneEntry.new("title", "07000000000")
diaryphone.add("07000000000")
diaryphone.extract_numbers("07000000000")
result = diaryphone.list_numbers
expect(result).to eq ["07000000000"]

#2 Extract phone number from a list
diaryphone = DiaryPhone.new
diaryphone_entry = DiaryPhoneEntry.new("title", "Hello 07000000000")
diaryphone.add("07000000000")
diaryphone.extract_numbers("07000000000")
result = diaryphone.list_numbers
expect(result).to eq ["07000000000"]

# 3 Extracts multiple phone numbers from a sentence 

diaryphone = DiaryPhone.new
diaryphone_entry = DiaryPhoneEntry.new("title", "Hello 07000000000")
diaryphone.add("Hello 07000000000 07000000002")
diaryphone.extract_numbers("Hello 07000000000 07000000002")
result = diaryphone.list_numbers
expect(result).to eq ["07000000000", "07000000002"]



#4 Return empty array if no phone numbers 
diaryphone = DiaryPhone.new
diaryphone_entry = DiaryPhoneEntry.new("title", "Hello 07000000000")
diaryphone.add("Hello")
diaryphone.extract_numbers("Hello")
result = diaryphone.list_numbers
expect(result).to eq []


#5 Remove numbers less than 11 digits
diaryphone = DiaryPhone.new
diaryphone_entry = DiaryPhoneEntry.new("title", "Hello 07000000000")
diaryphone.add("Hello 07000000000 070002")
diaryphone.extract_numbers("Hello 07000000000 070002")
result = diaryphone.list_numbers
expect(result).to eq ["07000000000"]

#6 Removes duplicate numbers from the list
diary = DiaryPhoneEntry.new("title", "Hello 07000000000")
diary.extract_numbers("Hello 07000000000 07000000000")
result = diary.list
expect(result).to eq ["07000000000"]


```

_Encode each example as a test. You can add to the above list as you go._

## 5. Implement the Behaviour

_After each test you write, follow the test-driving process of red, green,
refactor to implement the behaviour._