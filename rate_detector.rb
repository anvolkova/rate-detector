require './csv_reader.rb'
require './csv_writer.rb'
require './rate_counter.rb'

# Reading input parameters.
input_arr = ARGV
csv_file = input_arr[0]
rate_of_change = input_arr[1].to_i

readings = CsvReader.new.read(csv_file)
intervals = RateCounter.new.solve(readings, rate_of_change)
puts CsvWriter.new.write(intervals)
