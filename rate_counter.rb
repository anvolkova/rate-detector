# RateCounter finds the periods of time when the volume
# changes at a rate greater than a user defined volume.
class RateCounter
    def solve(readings, rate_of_change)
        reading_prev = readings[0]
        intervals = []
        readings.drop(1).each do |reading|
            delta_time_min = (reading.timestamp.to_i - reading_prev.timestamp.to_i) / 60.0
            delta_volume = (reading.volume - reading_prev.volume).abs
            rate = delta_volume / delta_time_min
            if rate > rate_of_change
                if intervals.any? && (intervals[-1][1].timestamp == reading_prev.timestamp)
                    intervals[-1][1] = reading
                else
                    intervals << [reading_prev, reading]
                end
            end
            reading_prev = reading
        end
        intervals
    end
end