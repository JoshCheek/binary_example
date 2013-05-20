require 'sort_words'

describe SortWords do
  it 'sorts the words' do
    SortWords.new(['c', 'a', 'b']).call.should == ['a', 'b', 'c']
    SortWords.new([]).call.should == []
  end
end
