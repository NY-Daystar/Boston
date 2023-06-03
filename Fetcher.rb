# TODO write unit tests 
# Fetch data in coingeckko API
class Fetcher
    attr_accessor :prices

    def self.FetchPrices(coin_ids)
        coins = coin_ids.join(",")
        currencies = CURRENCIES.join(",")
        url = "https://api.coingecko.com/api/v3/simple/price?ids=#{coins}&vs_currencies=#{currencies}"
        uri = URI(url)
        p "URL: #{url}"
        response = Net::HTTP.get(uri)
        @prices = JSON.parse(response)
    end
    
    def self.GetPrice(coin, currency)
        ## TODO check if @prices is nil throw excpetion
        return @prices[coin][currency]
    end

    # TODO comment
    def self.AccessPrices 
        return @prices
    end
end