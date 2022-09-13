namespace :rest do
  desc "Search on CoinAPI and save data"
  task create_coins: :environment do
    url = URI("#{ENV['URL_API_REST']}/assets")
    http = Net::HTTP.new(url.host, url.port)
    request = Net::HTTP::Get.new(url)
    request["X-CoinAPI-Key"] = ENV['APIKEY']
    response = http.request(request)
    if response.code == 200
      hash = JSON.parse(response.body)
    end
  end
end