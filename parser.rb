#!/usr/bin/env ruby
# frozen_string_literal: true

require './lib/log_parser'

file_path = ARGV[0]

if file_path.nil?
  puts 'Usage: parser.rb filename.log'
  exit 1
end

unless File.file?(file_path)
  puts "Error: File '#{file_path}' not found"
  exit 1
end

log_parser = LogParser.new
log_parser.parse(file_path)

puts 'SORTED TOTAL WEBPAGE VISITS'
puts log_parser.sorted_total_visits

puts 'SORTED UNIQUE WEBPAGE VIEWS'
puts log_parser.sorted_unique_views
