# frozen_string_literal: true

class LogParser
  def initialize
    @visits = {}
  end

  def parse(file_path)
    File.open(file_path).each do |visit|
      webpage, address = visit.split
      @visits[webpage] ||= []
      @visits[webpage] << address
    end

    @visits
  end

  def sorted_total_visits
    @visits.sort_by { |_webpage, addresses| -addresses.size }
           .map { |webpage, addresses| "#{webpage} #{addresses.size} visits" }
           .join("\n")
           .concat("\n")
  end

  def sorted_unique_views
    @visits.sort_by { |_webpage, addresses| -addresses.uniq.size }
           .map { |webpage, addresses| "#{webpage} #{addresses.uniq.size} unique views" }
           .join("\n")
           .concat("\n")
  end
end
