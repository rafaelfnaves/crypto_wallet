namespace :rest do
  desc "Search on CoinAPI and save data"
  task create_coins: :environment do
    url = URI("#{ENV['URL_API_REST']}/assets")
    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true
    request = Net::HTTP::Get.new(url)
    request["X-CoinAPI-Key"] = ENV['APIKEY']
    response = http.request(request)
    
    if response.code == "200"
      hash = JSON.parse(response.body)

      for coin in hash do
        unless coin["type_is_crypto"] == 0
          Coin.create!(
            name: coin["name"],
            asset_id: coin["asset_id"],
            data_start: coin["data_start"],
            data_end: coin["data_end"],
            price: coin["price_usd"],
            type_is_crypto: true
          )
        end
      end
    end
  end
end