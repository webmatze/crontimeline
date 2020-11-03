# frozen_string_literal: true

# Use the parse method to parse a crontab file for cronjob definitions.
module CronTimeline
  class << self
    def parse(file)
      lines = file.map do |line|
        Line.new line
      end
      cronjob_lines = lines.filter(&:cron_job?)
      cronjob_lines.map { |line| CronJob.new line }
    end
  end

  # parses a single line from the crontab
  class Line
    attr_reader :line

    # @param [String] line
    def initialize(line)
      @line = line.strip
    end

    def comment?
      @line.start_with? '#'
    end

    def empty?
      @line.size.zero?
    end

    def cron_job?
      !empty? && !comment?
    end

    def extract_time
      return unless cron_job?

      line_parts[0..4].join(' ')
    end

    def extract_command
      return unless cron_job?

      parts = line_parts
      parts[5..parts.size].join(' ')
    end

    private

    def line_parts
      @line.split(' ')
    end
  end
end
