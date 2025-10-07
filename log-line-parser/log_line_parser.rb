class LogLineParser
  attr_reader :line

  def initialize(line)
    @line = line
  end

  def message
    line.match?(reg_ex) ? line.match(reg_ex)[2].strip : nil
  end

  def log_level
    line.match?(reg_ex) ? line.match(reg_ex)[1].downcase : nil
  end

  def reformat
    [message, log_level_format].compact.join(" ")
  end

  def log_level_format
    log_level.nil? ? nil : "(#{log_level})"
  end

  private

  def reg_ex
    /\[(ERROR|INFO|WARNING)\]:\s+(.*)/i
  end
end
