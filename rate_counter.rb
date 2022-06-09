# RateCounter finds the periods of time when the volume
# changes at a rate greater than a user defined volume.
class RateCounter
    def solve(readings, rate_of_change)
        # If there is not enough data in the file
        if readings.length < 2
            return []
        end
        reading_prev = readings[0]
        intervals = []
        readings.drop(1).each do |reading|
            # If two timestamps are the same (eliminate division by zero)
            if reading.timestamp == reading_prev.timestamp
                reading_prev = reading
                next
            end
            delta_time_min = (reading.timestamp.to_i - reading_prev.timestamp.to_i) / 60.0
            delta_volume = (reading.volume - reading_prev.volume).abs
            rate = delta_volume / delta_time_min
            if rate > rate_of_change
                # Merging intervals
                # TODO new class of intervals
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