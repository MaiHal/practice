class SelectsController < ApplicationController
    require 'net/http'
    require 'uri'
    require 'json'
    require 'pp'
    require 'mechanize'

    RECIPE_CATEGORY_URL="https://app.rakuten.co.jp/services/api/Recipe/CategoryList/20170426?format=json&categoryType=large&applicationId=1025646104690209174"

    def index
        @menu = Menu.all
        @categories = recipe_categories['result']['large']
    end

    def recipe_categories
        agent = Mechanize.new
        res = agent.get('https://app.rakuten.co.jp/services/api/Recipe/CategoryList/20170426?format=json&categoryType=large&applicationId=1025646104690209174')
        results = JSON.parse(res.body.force_encoding('UTF-8'))
        return results
    end

    def show
    end

    def submit
        redirect_to("/menu/detail")
    end
end
