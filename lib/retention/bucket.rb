require 'retention/cohort'
require 'retention/period'

module Retention
  class Bucket
    attr_reader :cohort, :period, :members

    def initialize(cohort, period, members)
      @cohort = cohort
      @period = period
      @members = members
    end

    def retention_percentage
      return 0 if cohort.members.empty?

      ((members.size.fdiv cohort.members.size) * 100).round(2)
    end
  end
end
