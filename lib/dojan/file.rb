module Dojan
  class File
    attr_reader :name
    attr_accessor :data, :modified_at

    def initialize(name, data=nil)
      @name = name
      @data = data
      @modified_at = Time.now
    end

    def size
      @data.to_s.size
    end

  end
end
