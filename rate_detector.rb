require './csv_reader.rb'
require './csv_writer.rb'
require './rate_counter.rb'

# Reading input parameters.
csv_file = ARGV[0]
rate_of_change = ARGV[1].to_i

begin
    readings = CsvReader.new.read(csv_file)
rescue Errno::ENOENT
    puts "File #{csv_file} not found"
    return
end
intervals = RateCounter.new.solve(readings, rate_of_change)
puts CsvWriter.new.write(intervals)
