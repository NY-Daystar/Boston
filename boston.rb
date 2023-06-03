require 'net/http'
require 'json'

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
    
    prices = fetch_prices(coins)
    puts prices

    puts "prix du bitcoin eur : #{get_price(prices, "bitcoin", "eur")}"
    puts "prix du eth en usd : #{get_price(prices, "ethereum", "usd")}"
end

def fetch_prices(coin_ids)
    coins = coin_ids.join(",")
    currencies = CURRENCIES.join(",")
    url = "https://api.coingecko.com/api/v3/simple/price?ids=#{coins}&vs_currencies=#{currencies}"
    uri = URI(url)
    puts "URL: #{url}"
    response = Net::HTTP.get(uri)
    data = JSON.parse(response)
    return data
end

def get_price(prices, coin, currency)

    ## TODO verifier qque prices est non null
    return prices[coin][currency]
end

main()