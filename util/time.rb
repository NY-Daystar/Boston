require 'time'

class Time
    def self.getTime
        t = Time.now
        return t.strftime('%Y-%m-%d %H:%M:%S')
    end
end