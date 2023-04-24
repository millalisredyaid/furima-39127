class FurimasController < ApplicationController
  def index
    @furimas = furima.all
  end
end