require_relative 'lib/pageflow/closewindow/version'

Gem::Specification.new do |spec|
  spec.name          = "pageflow-closewindow"
  spec.version       = Pageflow::Closewindow::VERSION
  spec.authors       = ["Joost Baaij"]
  spec.email         = ["joost@spacebabies.nl"]

  spec.summary       = "Render a close button instead of theme logo"
  spec.description   = "Render a close button instead of theme logo"
  spec.homepage      = "https://github.com/scrollytelling/pageflow-closewindow"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.required_ruby_version = '>= 1.9.0'

  spec.add_runtime_dependency 'pageflow', '~> 12.x'
  spec.add_runtime_dependency 'pageflow-public-i18n', '~> 1.12.x'
  spec.add_runtime_dependency 'rails', '>= 4.2.0'
  spec.add_runtime_dependency 'sass-rails'

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
