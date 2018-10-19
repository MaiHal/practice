require 'net/http'
require 'uri'
require 'json'
class SelectsController < ApplicationController
    def index
        @menu = Menu.all
    end

    def show
    end

    def submit
        redirect_to("/menu/detail")
    end
end
