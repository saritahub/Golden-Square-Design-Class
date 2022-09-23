require '/Users/saritaradia/Desktop/Projects/Golden-Square-Design-Class/lib/09_DiaryPhone.rb'
require '/Users/saritaradia/Desktop/Projects/Golden-Square-Design-Class/lib/09_DiaryPhoneEntry.rb'
require '/Users/saritaradia/Desktop/Projects/Golden-Square-Design-Class/lib/09_Todo.rb'
require '/Users/saritaradia/Desktop/Projects/Golden-Square-Design-Class/lib/09_TodoList.rb'

RSpec.describe "Multi-Class integration" do
  it "Adds 2 diary entries and return these" do
    diaryphone = DiaryPhone.new
    diaryphone_entry = DiaryPhoneEntry.new("title", "contents")
    diaryphone.add("task one")
    diaryphone.add("task two")
    expect(diaryphone.all).to eq ["task one", "task two"]
  end

  it "selects diary entries to read based on how much time I have and my reading speed" do
    diaryphoneentry = DiaryPhoneEntry.new("title", "test " * 3)
    result = diaryphoneentry.reading_chunk(200, 1)
    expect(result).to eq "test test test"
  end

  context "Todolist and Todo Classes" do
    it "Returns incomplete tasks" do
      todo_list = TodoList.new
      todo_1 = Todo.new("Task")
      todo_list.add(todo_1)
      result = todo_list.incomplete
      expect(result).to eq [todo_1]
    end

    it "Returns one completed task when multiple tasks entered" do
      todo_list = TodoList.new
      todo_1 = Todo.new("Task")
      todo_2 = Todo.new("Second task")
      todo_list.add(todo_1)
      todo_list.add(todo_2)
      todo_1.mark_done!
      result = todo_list.complete
      expect(result).to eq [todo_1]
    end
  end

  context "Phone numbers" do
    it "Returns a phone number" do
      diaryphone = DiaryPhone.new
      diaryphone_entry = DiaryPhoneEntry.new("title", "07000000000")
      diaryphone.add("07000000000")
      diaryphone.extract_numbers("07000000000")
      result = diaryphone.list_numbers
      expect(result).to eq ["07000000000"]
    end

    it "Extract phone number from a list and returns it" do
      diaryphone = DiaryPhone.new
      diaryphone_entry = DiaryPhoneEntry.new("title", "Hello 07000000000")
      diaryphone.add("07000000000")
      diaryphone.extract_numbers("07000000000")
      result = diaryphone.list_numbers
      expect(result).to eq ["07000000000"]
    end

    it "Extracts multiple phone numbers and returns them" do
      diaryphone = DiaryPhone.new
      diaryphone_entry = DiaryPhoneEntry.new("title", "Hello 07000000000")
      diaryphone.add("Hello 07000000000 07000000002")
      diaryphone.extract_numbers("Hello 07000000000 07000000002")
      result = diaryphone.list_numbers
      expect(result).to eq ["07000000000", "07000000002"]
    end

    it "returns an empty array if there are no phone numbers" do
      diaryphone = DiaryPhone.new
      diaryphone_entry = DiaryPhoneEntry.new("title", "Hello 07000000000")
      diaryphone.add("Hello")
      diaryphone.extract_numbers("Hello")
      result = diaryphone.list_numbers
      expect(result).to eq []
    end

    it "removes digits under 11 numeric characters" do
      diaryphone = DiaryPhone.new
      diaryphone_entry = DiaryPhoneEntry.new("title", "Hello 07000000000")
      diaryphone.add("Hello 07000000000 070002")
      diaryphone.extract_numbers("Hello 07000000000 070002")
      result = diaryphone.list_numbers
      expect(result).to eq ["07000000000"]
    end

    it "removes duplicate numbers" do
      diaryphone = DiaryPhone.new
      diaryphone_entry = DiaryPhoneEntry.new("title", "Hello 07000000000")
      diaryphone.add("Hello 07000000000 07000000000")
      diaryphone.extract_numbers("Hello 07000000000 07000000000")
      result = diaryphone.list_numbers
      expect(result).to eq ["07000000000"]
    end

  end


end