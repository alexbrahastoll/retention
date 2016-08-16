require 'spec_helper'
require 'retention/analysis'

RSpec.describe Retention::Analysis do
  describe '#initialize' do
    context 'when the period_length is month' do
      it 'does correctly create the periods' do
        start_date = Time.new(2016, 1, 1)
        end_date = Time.new(2016, 3, 1)

        analysis = Retention::Analysis.new(start_date, end_date)

        expected_periods = [
          Retention::Period.new(start_date),
          Retention::Period.new(Time.new(2016, 2, 1)),
          Retention::Period.new(end_date)
        ]
        expect(analysis.periods).to eq(expected_periods)
      end
    end

    context 'when the period_length is week' do
      xit 'does correctly create the periods' do
        start_date = Time.new(2016, 1, 1)
        end_date = Time.new(2016, 1, 31)

        analysis = Retention::Analysis.new(start_date, end_date, period_length: :week)

        expected_periods = [
          Retention::Period.new(start_date, period_length: :week),
          Retention::Period.new(Time.new(2016, 1, 3), period_lenght: :week),
          Retention::Period.new(Time.new(2016, 1, 10), period_lenght: :week),
          Retention::Period.new(Time.new(2016, 1, 17), period_lenght: :week),
          Retention::Period.new(Time.new(2016, 1, 24), period_lenght: :week),
          Retention::Period.new(end_date, period_lenght: :week)
        ]
        expect(analysis.periods).to eq(expected_periods)
      end
    end
  end
end
