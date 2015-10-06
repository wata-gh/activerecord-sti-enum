# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'activerecord/sti/enum/version'

Gem::Specification.new do |spec|
  spec.name          = "activerecord-sti-enum"
  spec.version       = Activerecord::Sti::Enum::VERSION
  spec.authors       = ["wata"]
  spec.email         = ["wata.gm@gmail.com"]

  spec.summary       = %q{automatically creates enum of sti.}
  spec.description   = %q{automatically creates enum of sti by including.}
  spec.homepage      = "https://github.com/wata-gh/activerecord-sti-enum"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
end
