class FurimasController < ApplicationController
  def index
    furimas = Tweet.all
  end
end
