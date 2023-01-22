module ActsAsCsv
  def self.included(base)
    base.extend ClassMethods
  end

  class CsvRecord
    attr_accessor :fields

    def initialize(fields)
      @fields = fields
    end

    def to_s
      @fields.to_s
    end

    def inspect
      @fields.inspect
    end

    def method_missing(method_name)
      @fields[method_name.to_s]
    end
  end

  module ClassMethods
    def acts_as_csv
      include InstanceMethods
    end
  end

  module InstanceMethods
    include Enumerable
    def read
      @csv_contents = []
      filename = self.class.to_s.downcase + '.txt'
      file = File.new(filename)
      @headers = file.gets.chomp.split(', ')
      file.each { |row| @csv_contents << row.chomp.split(', ') }
    end
    attr_accessor :headers, :csv_contents

    def each
      # Enumerate over the csv content
      @csv_contents.each { |row| yield CsvRecord.new @headers.zip(row).to_h }
    end

    def initialize
      read
    end
  end
end

class CsvTest
  include ActsAsCsv
  acts_as_csv
end
m = CsvTest.new
puts m.headers.inspect
puts m.csv_contents.inspect
m.each { |row| p row.one }
