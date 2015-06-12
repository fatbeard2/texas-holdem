Gem::Specification.new do |spec|
  spec.name        = 'texas_holdem'
  spec.version     = '0.0.0'
  spec.date        = '2015-06-12'
  spec.summary     = 'Texas holdem'
  spec.description = 'Texas holdem'
  spec.authors     = ['Andrey Chernyshev']
  spec.email       = 'libdual@yandex.ru'
  spec.license       = 'MIT'
  spec.files         = `git ls-files -z`.split("\x0")
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'byebug'
end