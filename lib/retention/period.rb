require 'time_math'

module Retention
  class Period
    attr_reader :start_date, :end_date

    def initialize(start_date, options = {})
      opts = { period_length: :month }
      opts.merge!(options)

      @start_date = start_date
      @end_date = TimeMath.month.ceil(start_date)
    end

    def ==(other)
      start_date == other.start_date && end_date == other.end_date
    end
  end
end
