class SelectsController < ApplicationController
    require 'net/http'
    require 'uri'
    require 'json'

    def index
        @menu = Menu.all
        uri = URI.parse('https://app.rakuten.co.jp/services/api/Recipe/CategoryList/20170426?format=json&categoryType=large&applicationId=1025646104690209174')
        http = Net::HTTP.new(uri.host, uri.port)
        http.use_ssl = true
        http.verify_mode = OpenSSL::SSL::VERIFY_NONE

        req = Net::HTTP::Post.new(uri.path)
        #response = Net::HTTP.get_response()
        res = http.request(req)

        #result = ActiveSupport::JSON.decode(res.body)
        render json: res
    end

    def show
    end

    def submit
        redirect_to("/menu/detail")
    end
end
