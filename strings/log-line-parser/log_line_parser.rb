class LogLineParser
  def initialize(line)
    level, message = line.split(":")
    @message = message.strip
    @level = level.gsub(/\[|\]/, '').downcase
  end

  def message
    @message
  end

  def log_level
    @level
  end

  def reformat
    "#{message} (#{log_level})"
  end
end
