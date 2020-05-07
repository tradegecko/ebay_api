lib = File.expand_path("lib", __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "ebay_api/version"

Gem::Specification.new do |spec|
  spec.name          = "ebay_api"
  spec.version       = EbayApi::VERSION
  spec.authors       = ["TradeGecko"]
  spec.email         = ["integrations@tradegecko.com"]

  spec.summary       = "Ruby wrapper for eBay API."
  spec.description   = "Enables Ruby applications to communicate with the eBay API."
  spec.homepage      = "https://github.com/tradegecko/ebay_api"
  spec.license       = "MIT"

  spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/tradegecko/ebay_api"
  spec.metadata["changelog_uri"] = "https://github.com/tradegecko/ebay_api/blob/master/CHANGELOG.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"

  spec.add_dependency "oauth2"
  spec.add_dependency "httparty"
  spec.add_dependency "activesupport"
  spec.add_dependency "nokogiri"
end
