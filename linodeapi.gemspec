Gem::Specification.new do |s|
  s.name        = 'linodeapi'
  s.version     = '0.1.1'
  s.date        = Time.now.strftime("%Y-%m-%d")

  s.summary     = 'Linode API wrapper'
  s.description = "Wraps the Linode API with multiple levels of interaction"
  s.authors     = ['Les Aker']
  s.email       = 'me@lesaker.org'
  s.homepage    = 'https://github.com/akerl/linodeapi'
  s.license     = 'MIT'

  s.files       = `git ls-files`.split
  s.test_files  = `git ls-files spec/*`.split

  s.add_dependency 'httparty', '~> 0.13.1'

  s.add_development_dependency 'rubocop', '~> 0.32.0'
  s.add_development_dependency 'rake', '~> 10.4.0'
  s.add_development_dependency 'coveralls', '~> 0.8.0'
  s.add_development_dependency 'rspec', '~> 3.3.0'
  s.add_development_dependency 'fuubar', '~> 2.0.0'
  s.add_development_dependency 'activesupport', '~> 4.2.2'
end
