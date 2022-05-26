class MeterReading
    attr_reader :timestamp, :volume

    def initialize(timestamp, volume)
        @timestamp = timestamp
        @volume = volume
    end
end