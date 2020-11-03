# frozen_string_literal: true

require 'fugit'

module CronTimeline
  # represents a single cron job
  class CronJob
    attr_reader :cron_time_string, :cron_command

    def initialize(line)
      @line = line
      @cron_time_string = line.extract_time
      @cron_command = line.extract_command
    end

    def next_time
      cron&.next_time
    end

    def previous_time
      cron&.previous_time
    end

    def <=>(other)
      next_time <=> other.next_time
    end

    private

    def cron
      Fugit.parse_cron(@cron_time_string)
    end
  end
end
