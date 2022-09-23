class DiaryPhone
  def initialize
    @entry = []
    @numbers = []
    @passing_numbers = []
    @delimiters = [",", " ", ": "]
  end

  def add(entry) #Instance of DiaryPhoneEntry
  @entry.push(entry)
  end

  def all
    @entry
  end

  def count_words
    #Returns the number of words in all diaryphoneentries
    # To keep this simple, it will include the count of phone numbers
    @count_words = @entry.map do |entry |
      entry.count_words
    end.sum
    @count_words
  end

  def reading_time(wpm)
    return (count_words / wpm.to_f).ceil
  end

  def find_best_entry_for_reading_time(wpm, minutes)
    no_words_can_read = wpm * minutes
    @entry_to_read = @entry.filter do |entry|
      entry.reading_time(wpm) <= minutes
    end

    sort = @entry_to_read,max_by do |entry|
      entry.count_words
    end
  end
  #Phone number methods
  def extract_numbers(numbers)
    @numbers.push(numbers)
    @numbers = @numbers.join(" ").split(Regexp.union(@delimiters))
  end

  def list_numbers
    @numbers.each do |num|
      if num[0] == "0" && num.length == 11
        @passing_numbers.push(num)
      end
    end
    @passing_numbers.uniq
  end

end