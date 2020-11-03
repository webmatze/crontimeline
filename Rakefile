# frozen_string_literal: true

require_relative 'lib/cron_timeline'

desc 'parses a crontab and displays the upcoming cronjobs'
task :parse, [:filename] do |_task, args|
  cron_file = File.open(args.filename)
  CronTimeline.parse(cron_file).sort.each do |cronjob|
    puts "#{cronjob.next_time} | #{cronjob.cron_time_string} | #{cronjob.cron_command}"
  end
end
