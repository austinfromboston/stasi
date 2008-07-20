module HourLogsHelper
  def to_hours( minutes )
    minutes.minutes.to_f / 1.hours
  end
end
