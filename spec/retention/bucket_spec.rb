require 'spec_helper'
require 'retention/bucket'

RSpec.describe Retention::Bucket do
  describe '#retention_percentage' do
    context 'when the cohort has members' do
      it 'does return the percentage with a precision of 2 digits' do
        cohort = instance_double('Retention::Cohort')
        allow(cohort).to receive_messages(members: ['Alex', 'Anna', 'John', 'Mary', 'Ricardo', 'Julia'])
        period = instance_double('Retention::Period')
        members = ['Alex']
        bucket = Retention::Bucket.new(cohort, period, members)

        expect(bucket.retention_percentage).to eq(16.67)
      end
    end

    context 'when the cohort has no members' do
      it 'does return 0' do
        cohort = instance_double('Retention::Cohort')
        allow(cohort).to receive_messages(members: [])
        period = instance_double('Retention::Period')
        members = []
        bucket = Retention::Bucket.new(cohort, period, members)

        expect(bucket.retention_percentage).to eq(0)
      end
    end
  end
end
