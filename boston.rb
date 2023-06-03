require 'net/http'
require 'json'

require_relative 'fetcher'

# TODO a installer
    # gem install net-http
    # gem install json
## TODO  voir  pour  les  commentaires des meethodes
## TODO mettre uun logger avec un fichier et le temps
# TODO README, LICENCE, CHANGELOOG
PROJECT =  "PROJECT_NAME"
VERSION = "1.0.0"

CURRENCIES = ["usd", "eur"]

def main()
    puts "PROJECT : #{PROJECT}" ## TODO faire une methode log avec une geestioon de couleur + dans un fichier util.rbs
    puts "VERSION : #{VERSION}"
    
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