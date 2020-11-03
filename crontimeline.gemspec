# frozen_string_literal: true

require_relative 'lib/cron_timeline'

Gem::Specification.new do |s|
  s.name = 'crontimeline'
  s.version = CronTimeline::VERSION
  s.authors = ['Mathias Karstädt']
  s.email = 'mathias.karstaedt@gmail.com'
  s.license = 'BSD-2-Clause'
  s.homepage = 'https://github.com/webmatze/crontimeline'
  s.summary = 'Display your crontab as an ordered timeline'
  s.description = 'Parses your crontab and orders it by time'

  s.required_ruby_version = '>= 2.7.0'

  s.files = Dir['lib/**/*.rb', 'LICENSE']
  s.bindir = 'exe'
  s.executables = ['crontimeline']
  s.require_path = 'lib'

  s.add_dependency 'fugit', '>=1.4.0'
  s.add_development_dependency 'rake'
end
