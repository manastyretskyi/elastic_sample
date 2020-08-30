class Api::AuthorsController < ApplicationController
  before_action :find_author, only: :show

  def show; end

  private

  def find_author
    @author = Author.find(params[:id])
  end
end
