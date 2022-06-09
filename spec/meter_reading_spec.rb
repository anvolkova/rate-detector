require 'spec_helper'
require './meter_reading'

describe MeterReading do
    context 'when initializing' do
        let(:reading) do
            MeterReading.new(Time.new(2022, 10, 31, 2, 2, 2), 100)
        end

        it 'should initialize the object' do
            expect(reading.timestamp).to eq Time.new(2022, 10, 31, 2, 2, 2)
            expect(reading.volume).to eq 100
        end
    end
end