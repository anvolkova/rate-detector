require 'spec_helper'
require './rate_counter'
require './meter_reading'

describe RateCounter do
    let(:rate_counter) { RateCounter.new }
    let(:rate_of_change) { 100 }

    context "when the volume changes at a rate greater than a user defined rate" do
        let(:readings) do
            [MeterReading.new(Time.new(2019, 4, 29, 10, 3, 0), 9100),
            MeterReading.new(Time.new(2019, 4, 29, 10, 4, 0), 9400),
            MeterReading.new(Time.new(2019, 4, 29, 10, 15, 30), 10200)]
        end

        it "finds the intervals" do
            intervals = rate_counter.solve(readings, rate_of_change)
            expect(intervals).to match_array([[
                have_attributes(timestamp: Time.new(2019, 4, 29, 10, 3, 0), volume: 9100),
                have_attributes(timestamp: Time.new(2019, 4, 29, 10, 4, 0), volume: 9400),
            ]])
        end
    end

    context "when there are consecutive groups of entries that meet the rate of change criteria" do
        let(:merge_readings) do
            [MeterReading.new(Time.new(2019, 4, 29, 10, 3, 0), 9100),
            MeterReading.new(Time.new(2019, 4, 29, 10, 4, 0), 9400),
            MeterReading.new(Time.new(2019, 4, 29, 10, 10, 0), 10600)]
        end

        it "merges the intervals" do
            intervals = rate_counter.solve(merge_readings, rate_of_change)
            expect(intervals).to match_array([[
                have_attributes(timestamp: Time.new(2019, 4, 29, 10, 3, 0), volume: 9100),
                have_attributes(timestamp: Time.new(2019, 4, 29, 10, 10, 0), volume: 10600),
            ]])
        end
    end
end