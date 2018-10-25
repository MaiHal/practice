class Rakuten < ActiveResource::Base
    def
        uri = URI.parse("https://app.rakuten.co.jp/services/api/Recipe/CategoryList/20170426?format=json&applicationId=#{ENV['APPLICATION_ID']}")
        conn = Faraday::Connection.new(:url => RECIPE_CATEGORY_URL) do |builder|
            builder.use Faraday::Request::UrlEncoded  # リクエストパラメータを URL エンコードする
            builder.use Faraday::Response::Logger     # リクエストを標準出力に出力する
            builder.use Faraday::Adapter::NetHttp     # Net/HTTP をアダプターに使う
        end
        
        response = conn.get '?categoryType=large'
        puts response.body
    end
end