Gem::Specification.new do |spec|
  spec.name        = 'texas-holdem'
  spec.version     = '0.0.0'
  spec.date        = '2015-06-12'
  spec.summary     = 'Texas holdem'
  spec.description = 'Texas holdem'
  spec.authors     = ['Andrey Chernyshev']
  spec.email       = 'libpual@yandex.ru'
  spec.license       = 'MIT'
  spec.files         = `git ls-files -z`.split("\x0")
  spec.test_files    = spec.files.grep(%r{^(spec)/})
  spec.require_paths = ['lib']
  spec.executables = ['texas-holdem']

  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec'
end