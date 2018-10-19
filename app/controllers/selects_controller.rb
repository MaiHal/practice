class SelectsController < ApplicationController
    require 'net/http'
    require 'uri'
    require 'json'
    require 'pp'

    def index
        @menu = Menu.all
        uri = URI.parse("https://app.rakuten.co.jp/services/api/Recipe/CategoryList/20170426?format=json&applicationId=#{ENV['APPLICATION_ID']}")
        conn = Faraday::Connection.new(:url => uri) do |builder|
            builder.use Faraday::Request::UrlEncoded
            builder.use Faraday::Response::Logger
            builder.use Faraday::Adapter::NetHttp
        end

        res = Faraday.new(:url => "https://app.rakuten.co.jp/services/api/Recipe/CategoryList/20170426?format=json&applicationId=#{ENV['APPLICATION_ID']}").get("&categoryType=large")
        pp res
    end

    def show
    end

    def submit
        redirect_to("/menu/detail")
    end
end
