# Crontimeline

Crontimeline is a simple tool to display your crontab entries in an ordered timeline.

## Install

```shell
gem install crontimeline
```

## Usage

### From within the Ruby code

If you want to parse a local crontab file and iterate over its contents in an ordered way:

```ruby
crontab_file = File.open 'path/to/crontab'
cronjobs = CronTimeline.parse crontab_file
cronjobs.sort.each do |cronjob|
  puts cronjob.next_time
end
```

### From the command line

If you want to see a timeline of your crontab

```shell
crontimeline
```

## Semantic Versioning

Crontimeline attempts to follow [semantic versioning](https://semver.org) and
bump major version only when backwards incompatible changes are released.
