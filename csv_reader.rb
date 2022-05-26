require 'csv'
require 'time'
require './meter_reading.rb'

class CsvReader
    def read(filename)
        readings = []
        CSV.foreach(filename, headers: true) do |line|
            readings << MeterReading.new(
                Time.strptime(line["Timestamp"], "%Y-%m-%d %k:%M:%S"),
                line["Volume"].to_i)
        end
        readings
    end
end