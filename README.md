# Retention

**Work in progress, not yet released.**

Retention analysis is a type of Cohort analysis. Its objective is to analyze how users of a given group
keep on interacting with your company over time.

To make it clearer, let's go through an example. Let's say you run an eCommerce. Given that, one example of a
retention analysis would be to study how many users of the group that made its first purchase in January 2016
made a new purchase in each subsequent month.

The purpose of this gem is to abstract the common parts of any retention analysis, offering a simple
framework you can use as the base for your custom analysis.

# Usage

One simple way of using Retention is to create a custom rake task so you can easily generate new analysis:

```ruby
namespace :my_custom_analysis do
  task run: :environment do
    start_date = Time.new(2016, 1, 1)
    end_date = Time.new(2016, 3, 1)

    # The periods (i.e. months) will be automatically generated.
    analysis = Retention::Analysis.new(start_date, end_date)
    analysis.run(MyCustomAnalysis.new)

    # Publish the analysis as a CSV.
    Retention::CSVPublisher.new(analysis).publish('path/for/csv')
  end
end
```

```ruby
  # Class that implements the custom bits of the analysis you want to make.
  class MyCustomAnalysis
    # This method will receive the cohort period and should return and array whose
    # elements represent the members of the cohort.
    def determine_cohort_members(period)
      # We return an array filled with ids of users that made their first purchase
      # at the given period.
      Order.
        where(created_at: period.start_date..period.end_date).
        map do |order|
          Order.
          where('user_id = ? AND created_at < ?', order.user_id, period.start_date).
          count > 0 ? nil : order.user_id
        end.
        compact.
        uniq
    end

    # This method will be called once for each subsequent month until the current month.
    # For each period, it should return the members of the cohort that should be included
    # in the given period.
    def calculate_retention(cohort_members, period)
      cohort_members.select do |user_id|
        Order.
          where(user_id: user_id, created_at: period.start_date..period.end_date).
          count > 0
      end
    end
  end
```
# License

MIT. See [LICENSE](https://github.com/alexbrahastoll/retention/blob/master/LICENSE) for licensing details.

# Author

Alex Stoll, [http://alexbs.com.br](http://alexbs.com.br)
