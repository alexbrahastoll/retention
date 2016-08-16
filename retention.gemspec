Gem::Specification.new do |s|
  s.name        = 'retention'
  s.version     = '0.0.1'
  s.date        = '2016-08-15'
  s.summary     = 'Easier and faster retention analysis.'
  s.description = 'A simple and flexible gem to make it easier and faster to do retention analysis.'
  s.authors     = ['Alex Stoll']
  s.email       = 'alexbrahastoll@gmail.com'
  s.files       = ['lib/retention.rb']
  s.homepage    = 'https://github.com/alexbrahastoll/retention'
  s.license     = 'MIT'
  s.add_development_dependency 'rspec', ['~> 3.5']
  s.add_runtime_dependency 'time_math2', ['~> 0.0.5']
end
