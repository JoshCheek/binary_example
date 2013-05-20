require 'open3'

describe 'the binary' do
  def execute_binary(filename)
    binary_path = File.expand_path '../../bin/sort_words', __FILE__
    Open3.capture3(binary_path, filename)
  end

  context 'when given a valid filename' do
    let(:filename) { File.expand_path '../input_file', __FILE__ }

    before { File.write  filename, "c\na\nb" }
    after  { File.delete filename            }

    it 'prints the words in the file out in sorted order' do
      stdout, stderr, status = execute_binary(filename)
      stdout.should == "a\nb\nc\n"
    end

    it 'prints nothing to stderr' do
      stdout, stderr, status = execute_binary(filename)
      stderr.should == ""
    end

    it 'exits with a status of 0' do
      stdout, stderr, status = execute_binary(filename)
      status.should be_success
    end
  end

  context 'when given an invalid filename' do
    let(:nonexistent_filename) { '/i_dont_exist' }

    it 'prints nothing to stdout' do
      stdout, stderr, status = execute_binary(nonexistent_filename)
      stdout.should == ""
    end

    it 'prints "no such file" to stderr' do
      stdout, stderr, status = execute_binary(nonexistent_filename)
      stderr.should == "no such file\n"
    end

    it 'exits with a status of 1' do
      stdout, stderr, status = execute_binary(nonexistent_filename)
      status.should_not be_success
    end
  end
end

