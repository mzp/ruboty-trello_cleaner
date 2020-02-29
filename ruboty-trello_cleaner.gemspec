
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "ruboty/trello_cleaner/version"

Gem::Specification.new do |spec|
  spec.name          = "ruboty-trello_cleaner"
  spec.version       = Ruboty::TrelloCleaner::VERSION
  spec.authors       = ["mzp"]
  spec.email         = ["mzpppp@gmail.com"]

  spec.summary       = %q{Rubty plugin to cleanup Trello board}
  spec.description   = %q{This plugin cleanup old cards of Trello board}
  spec.homepage      = "https://github.com/mzp/ruboty-trello_cleaner"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 13.0"
  spec.add_development_dependency "dotenv"
  spec.add_dependency 'activemodel', '4.2.10'
  spec.add_dependency "ruboty"
  spec.add_dependency "ruby-trello"
end
