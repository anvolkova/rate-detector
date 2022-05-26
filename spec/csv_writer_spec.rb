require 'spec_helper'
require './csv_writer'
require './meter_reading'

describe CsvWriter do
    let(:csv_writer) { CsvWriter.new }

    let(:intervals) do
        [[MeterReading.new(Time.new(2022, 10, 31, 10, 3, 0), 9100),
        MeterReading.new(Time.new(2022, 10, 31, 10, 4, 0), 9400)]]
    end

    it "should generate the output CSV in the given format" do
        output = csv_writer.write(intervals)
        expect(output).to eq <<EOF
Start Timestamp,End Timestamp,Start Volume,End Volume
2022-10-31 10:03:00,2022-10-31 10:04:00,9100,9400
EOF
    end
end