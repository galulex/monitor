# Class to parse system processes
class Monitor
  PROCESSES = /
    \s?(?<pid>\d*)\s+
    (?<user>\S+)(\s|\d)+\w+\s+
    (?<cpu>\d+\.\d+)\s+
    (?<mem>\d+.\d+)\s+\S+\s
    (?<name>\S+)
  /x

  DISK = /.*\d+\s+(?<used>\d+)\s+(?<available>\d+)\s+/

  def processes
    @processes ||= top[7..-1].map { |l| match(l) }
  end

  def cpu
    @cpu ||= top[2].split[1]
  end

  def disk
    @disk ||= match(`df -T /`.split("\n").last, DISK)
  end

  def to_hash
    { cpu: cpu, disk: disk, processes: processes }
  end

  private

  def match(line, regex = PROCESSES)
    data = line.match(regex)
    data.names.each_with_object({}) do |name, h|
      h[name.to_sym] = data[name].strip
    end
  end

  def top
    @top ||= `top -n 1 -b`.split("\n")
  end
end
