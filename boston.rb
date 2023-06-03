require 'net/http'
require 'json'

require_relative 'util/__init__'
require_relative 'fetcher'

# TODO put logger with file output and time

PROJECT =  "Boston"
VERSION = "1.0.0"

CURRENCIES = ["usd", "eur"]

def main()
    puts "PROJECT : #{PROJECT.yellow}"
    puts "VERSION : #{VERSION.yellow}"
    
    timer = 10
    
    loop do
        run()
        sleep(timer)
    end
    
end

def run()
    puts "fetching prices from coingecko"

    coins = ["bitcoin", "ethereum"]
    puts "#{coins}"
    
    Fetcher.FetchPrices(coins)
    puts Fetcher.AccessPrices

    puts "prix du bitcoin eur : #{Fetcher.GetPrice("bitcoin", "eur")}"
    puts "prix du eth en usd : #{Fetcher.GetPrice("ethereum", "usd")}"
end

main()