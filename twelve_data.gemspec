# frozen_string_literal: true

require_relative "lib/twelve_data/version"

Gem::Specification.new do |spec|
  spec.name = "twelve_data"
  spec.version = TwelveData.gem_version
  spec.authors = ["Lauri Jutila"]
  spec.email = ["git@laurijutila.com"]

  spec.summary = "Ruby gem for Twelve Data API"
  spec.description = "Ruby gem for Twelve Data API."
  spec.homepage = "https://github.com/ljuti/twelve_data-ruby"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 3.1.0"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/ljuti/twelve_data-ruby"
  spec.metadata["changelog_uri"] = "https://github.com/ljuti/twelve_data-ruby/blob/main/CHANGELOG.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  gemspec = File.basename(__FILE__)
  spec.files = IO.popen(%w[git ls-files -z], chdir: __dir__, err: IO::NULL) do |ls|
    ls.readlines("\x0", chomp: true).reject do |f|
      (f == gemspec) ||
        f.start_with?(*%w[bin/ test/ spec/ features/ .git .github appveyor Gemfile])
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Uncomment to register a new dependency of your gem
  # spec.add_dependency "example-gem", "~> 1.0"
  spec.add_dependency "faraday", "~> 2.0"
  spec.add_dependency "faraday-retry", "~> 2.0"
  spec.add_dependency "oj", "~> 3.0"
  spec.add_dependency "anyway_config", "~> 2.0"
  spec.add_dependency "faye-websocket", "~> 0.11"
  spec.add_dependency "dry-struct", "~> 1.0"
  spec.add_dependency "dry-types", "~> 1.0"

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
end
