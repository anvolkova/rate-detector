# MeterReading represents volume at a given timestamp.
class MeterReading
    attr_reader :timestamp, :volume

    def initialize(timestamp, volume)
        @timestamp = timestamp
        @volume = volume
    end
end