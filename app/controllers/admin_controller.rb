class AdminController < ApplicationController
  before_action :authenticate_user!, except: :show
  before_action :get_articles, only: :dashboard

  def dashboard

  end

  private

  def get_articles
    @articles = Article.all
  end

end
