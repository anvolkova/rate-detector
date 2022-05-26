require 'csv'

# CsvWriter writes a sequence of intervals in CSV format.
class CsvWriter
    def write(intervals)
        CSV.generate do |csv|
            csv << ["Start Timestamp", "End Timestamp", "Start Volume", "End Volume"]
            intervals.each do |interval|
                csv << [interval[0].timestamp.strftime("%Y-%m-%d %k:%M:%S"),
                    interval[1].timestamp.strftime("%Y-%m-%d %k:%M:%S"), 
                    interval[0].volume,
                    interval[1].volume]
            end
        end
    end
end