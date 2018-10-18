require 'net/http'
require 'uri'
require 'json'
class SelectsController < ApplicationController
    def index
        @menu = Menu.all
        uri = URI.parse("https://app.rakuten.co.jp/services/api/Recipe/CategoryList/20170426?format=json&applicationId=#{ENV['APPLICATION_ID']}&categoryId=41")
        # リクエストパラメタを、インスタンス変数に格納
        @query = uri.query

        # 新しくHTTPセッションを開始し、結果をresponseへ格納
        http = Net::HTTP.new(uri.host, uri.port)

        http.use_ssl = true
        http.verify_mode = OpenSSL::SSL::VERIFY_NONE

        req = Net::HTTP::Post.new(uri.path)
        
        response = http.request(req)
        # 例外処理の開始
        begin
        # responseの値に応じて処理を分ける
        case response
        # 成功した場合
        when Net::HTTPSuccess
            # responseのbody要素をJSON形式で解釈し、hashに変換
            @result = JSON.parse(response.body)
        # 別のURLに飛ばされた場合
        when Net::HTTPRedirection
            @message = "Redirection: code=#{response.code} message=#{response.message}"
        # その他エラー
        else
            @message = "HTTP ERROR: code=#{response.code} message=#{response.message}"
        end
        # エラー時処理
        rescue IOError => e
        @message = "e.message"
        rescue TimeoutError => e
        @message = "e.message"
        rescue JSON::ParserError => e
        @message = "e.message"
        rescue => e
        @message = "e.message"
        end
    end

    def show
    end

    def submit
        redirect_to("/menu/detail")
    end
end
