class BakeriesController < ApplicationController
    def index
        bakeries = Bakery.all
        render json: bakeries, include: :reviews
    end
end
