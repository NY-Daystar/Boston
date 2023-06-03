require 'time'

def time()
    t = Time.now
    return t.strftime('%Y-%m-%d %H:%M:%S')
end