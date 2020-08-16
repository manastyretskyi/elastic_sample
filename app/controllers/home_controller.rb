# frozen_string_literal: true

class HomeController < ApplicationController
  layout "react"

  def index
    @search = params[:search]
  end
end
