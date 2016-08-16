require 'spec_helper'
require 'retention'

RSpec.describe Retention::Period do
  describe '#==' do
    context 'when self and other dates are equal' do
      it 'does return true' do
        period = Retention::Period.new(Time.new(2016, 1, 1))
        other_period = Retention::Period.new(Time.new(2016, 1, 1))

        expect(period).to eq(other_period)
      end
    end

    context 'when self start_date and other start_date are not equal' do
      it 'does return false' do
        period = Retention::Period.new(Time.new(2016, 1, 1))
        other_period = Retention::Period.new(Time.new(2016, 1, 2))

        expect(period).not_to eq(other_period)
      end
    end

    context 'when self and other dates are not equal' do
      it 'does return false' do
        period = Retention::Period.new(Time.new(2016, 1, 1))
        other_period = Retention::Period.new(Time.new(2016, 12, 1))

        expect(period).not_to eq(other_period)
      end
    end
  end
end
