# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "backgrounded_mailer/version"

Gem::Specification.new do |s|
  s.name        = "backgrounded_mailer"
  s.version     = BackgroundedMailer::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Geoffrey Hichborn"]
  s.email       = ["geoff@socialcast.com"]
  s.homepage    = "http://github.com/phene/backgrounded_mailer"
  s.summary     = %q{Extends ActionMailer to send e-mails using backgrounded}
  s.description = %q{Send e-mails in the background by default using the backgrounded gem}

  s.rubyforge_project = "backgrounded_mailer"

  s.add_runtime_dependency(%q<backgrounded>, [">= 0.7"])
  s.add_runtime_dependency(%q<mail>, [">= 2.2"])
  s.add_development_dependency(%q<shoulda>, [">= 0"])
  s.add_development_dependency(%q<mocha>, [">= 0"])
  s.add_development_dependency(%q<sqlite3-ruby>, [">= 1.3.2"])

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
