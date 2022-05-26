# rate-detector
A small application in Ruby that reads a CSV file and finds the periods of time when the volume changes at a rate greater than a user defined  volume.

The first parameter to the script is the path to the CSV  file, and the second parameter is an integer value representing the rate of change:

`
ruby rate_detector.rb <csv_file> <rate_of_change>
`
