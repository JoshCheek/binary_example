class SortWords
  def initialize(unsorted_words)
    @unsorted_words = unsorted_words
  end

  def call
    @sorted_words ||= @unsorted_words.sort
  end
end
