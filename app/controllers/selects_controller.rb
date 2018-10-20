class SelectsController < ApplicationController
    require 'net/http'
    require 'uri'
    require 'json'
    require 'pp'
    require 'mechanize'

    RECIPE_CATEGORY_URL="https://app.rakuten.co.jp/services/api/Recipe/CategoryList/20170426?format=json&categoryType=large&applicationId=1025646104690209174"

    def index
        @menu = Menu.all
        results = recipe_categories
        render json: results
    end

    def recipe_categories
        agent = Mechanize.new
        res = agent.get('https://app.rakuten.co.jp/services/api/Recipe/CategoryList/20170426?format=json&categoryType=large&applicationId=1025646104690209174')
        return res.body
    end

    def show
    end

    def submit
        redirect_to("/menu/detail")
    end
end
