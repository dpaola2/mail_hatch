Gem::Specification.new do |s|
  s.name               = "mail_hatch"
  s.version            = "0.0.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Dave Paola"]
  s.date = %q{2020-02-25}
  s.description = %q{Ruby gem for Mail Hatch}
  s.email = %q{dpaola2@gmail.com}
  s.files = ["lib/mail_hatch.rb", "lib/mail_hatch_error.rb", "lib/mail_hatch_job.rb", "lib/mail_hatch_serializer.rb"]
  s.test_files = []
  s.homepage = "https://www.mailhatch.io"
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.6.2}
  s.summary = %q{Send stunning emails in minutes}
  s.metadata = { "source_code_uri" => "https://github.com/dpaola2/mail_hatch" }

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end