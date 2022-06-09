require 'spec_helper'
require 'tempfile'
require './csv_reader'

describe CsvReader do
    let(:csv_reader) { CsvReader.new }

    let(:test_file) do
        Tempfile.new('csv').tap do |f|
            f << <<EOF
Timestamp,Volume
2019-04-29 10:03:00,9100
2019-04-29 10:04:00,9400
EOF
            f.close
        end
    end

    after do
        test_file.unlink
    end

    it 'should read CSV file in the given format' do
        readings = csv_reader.read(test_file)
        expect(readings).to match_array([
            have_attributes(timestamp: Time.new(2019, 4, 29, 10, 3, 0), volume: 9100),
            have_attributes(timestamp: Time.new(2019, 4, 29, 10, 4, 0), volume: 9400),
          ])
    end
end