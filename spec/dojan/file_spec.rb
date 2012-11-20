require 'spec_helper'

describe Dojan::File do
  
  describe 'File attributes' do
    before do
      @file = Dojan::File.new('some_file.txt')
    end

    it 'must create a new instance' do
      @file.must_be_instance_of Dojan::File
    end

    it 'must deny direct access to name'do
      proc { @file.name = 'other_file.txt' }.must_raise NoMethodError
    end

    it 'must set name to <<some_file.txt>>' do
      @file.name.must_equal 'some_file.txt'
    end

    it 'must set data to nil by default' do
      @file.data.must_equal nil
      @file.size.must_equal 0
    end

    it 'must set the modified_at timestamp' do
      @file.modified_at.to_i.must_be_within_epsilon Time.now.to_i, 1
    end

    it 'must raise when name parameter is missing' do
      proc {Dojan::File.new}.must_raise ArgumentError, %r(0 for 1)
    end

    after do
      remove_instance_variable :@file
    end
  end

  describe 'handling binary data' do
    before do
      binary_data = "\370\000\364\001\000\000"
      @file = Dojan::File.new('binary.data', binary_data)
    end

    it 'must store binary data' do
      @file.data.must_equal "\370\000\364\001\000\000"
    end

    it 'must return the correct size' do
      @file.size.must_equal 6
    end

    after do
      remove_instance_variable :@file
    end

  end

  describe 'handling ASCII data' do
    before do
      ascii_data = "some ASCII data"
      @file = Dojan::File.new('binary.data', ascii_data)
    end

    it 'must store ASCII data' do
      @file.data.must_equal "some ASCII data"
    end

    it 'must return correct size' do
      @file.size.must_equal 15
    end

    after do
      remove_instance_variable :@file
    end
  end

end
