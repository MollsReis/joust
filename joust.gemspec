spec = Gem::Specification.new do |s|
  s.name = "joust"
  s.version = "1.0.0"
  s.author = "R. Scott Reis"
  s.platform = Gem::Platform::RUBY
  s.summary = "JSON-RPC Server Specification Compatibility Testing"
  s.executables = %w[joust]
  s.require_path = "lib"
  s.has_rdoc = true
  s.homepage = 'https://github.com/EvilScott/joust'
  s.rdoc_options << '-m' << 'README.rdoc' << '-t' << 'Joust'
  s.extra_rdoc_files = ["README.rdoc"]
  s.files =  %w[LICENSE.txt README.rdoc Rakefile]
  s.files += Dir['data/*.yml']
  s.files += Dir['lib/**/*.rb']
  s.test_files = Dir['spec/*.rb']
end