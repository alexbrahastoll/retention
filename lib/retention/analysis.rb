require 'time_math'
require 'retention/period'

module Retention
  class Analysis
    attr_reader :start_date, :end_date, :periods

    def initialize(start_date, end_date, options = {})
      @start_date = start_date
      @end_date = end_date

      opts = { period_length: :month }
      opts.merge!(options)

      @periods = []
      send("generate_#{opts[:period_length]}_periods")
    end

    private

    def generate_month_periods
      first_period_s_date = TimeMath.month.floor(start_date)
      last_period_s_date = TimeMath.month.floor(end_date)
      TimeMath.month.sequence(first_period_s_date..last_period_s_date).to_a.each do |period_s_date|
        @periods << Retention::Period.new(period_s_date)
      end
    end

    # TODO Implement weekly analysis.
    def generate_week_periods
    end
  end
end
