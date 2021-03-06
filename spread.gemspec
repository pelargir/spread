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
    "deleted_files",
    "files/public/images/spread/email.png",
    "init.rb",
    "install.rb",
		"lib/spread.rb",
		"lib/spread/asset_copier.rb",
		"lib/spread/controller.rb",
    "MIT-LICENSE",
    "Rakefile",
		"README",
		"spread.gemspec",
		"tasks/asset_copier.rake",
		"templates/email.html.erb",
		"templates/form.html.erb"
		]
  s.rdoc_options = ["--main", "README"]
  s.extra_rdoc_files = ["README"]
end