Gem::Specification.new do |s|
  s.name        = 'linodeapi'
  s.version     = '2.0.1'
  s.date        = Time.now.strftime('%Y-%m-%d')

  s.summary     = 'Linode API wrapper'
  s.description = 'Wraps the Linode API with multiple levels of interaction'
  s.authors     = ['Les Aker']
  s.email       = 'me@lesaker.org'
  s.homepage    = 'https://github.com/akerl/linodeapi'
  s.license     = 'MIT'

  s.files       = `git ls-files`.split
  s.test_files  = `git ls-files spec/*`.split

  s.add_dependency 'httparty', '~> 0.16.0'

  s.add_development_dependency 'codecov', '~> 0.1.1'
  s.add_development_dependency 'fuubar', '~> 2.3.0'
  s.add_development_dependency 'goodcop', '~> 0.6.0'
  s.add_development_dependency 'rake', '~> 12.3.0'
  s.add_development_dependency 'rspec', '~> 3.8.0'
  s.add_development_dependency 'rubocop', '~> 0.66.0'
  s.add_development_dependency 'vcr', '~> 4.0.0'
  s.add_development_dependency 'webmock', '~> 3.5.1'
end
