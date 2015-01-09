module Formatting
  extend self

  def hms(seconds, show_hour_if_zero: true)
    seconds = seconds.to_i
    sec  = seconds % 60
    min  = (seconds / 60) % 60
    hour = seconds / 3600
    if hour == 0 && !show_hour_if_zero
      sprintf("%02d:%02d", min, sec)
    else
      sprintf("%d:%02d:%02d", hour, min, sec)
    end
  end

  def hm(minutes, show_hour_if_zero: true)
    minutes = minutes.to_i
    min  = minutes % 60
    hour = minutes / 60
    if minutes == 0 && !show_hour_if_zero
      sprintf("%02d", hour)
    else
      sprintf("%02d:%02d", hour, min)
    end
  end
end
