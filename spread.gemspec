Gem::Specification.new do |s|
  s.name     = "spread"
  s.version  = "0.5"
  s.date     = "2008-10-22"
  s.summary  = "Makes it easy to add tell-a-friend functionality to any Rails app."
  s.email    = "pelargir@gmail.com"
  s.homepage = "http://github.com/pelargir/spread"
  s.description = "Makes it easy to add tell-a-friend functionality to any Rails app."
  s.has_rdoc = true
  s.authors  = ["Matthew Bass"]
  s.files    = [
    "CHANGELOG",
    "init.rb",
		"lib/spread.rb",
    "MIT-LICENSE",
    "Rakefile",
		"README",
		"spread.gemspec"
		]
  s.rdoc_options = ["--main", "README"]
  s.extra_rdoc_files = ["README"]
end