class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :get_featured_articles
  before_action :get_relational_articles
  before_action :get_recent_articles
  before_action :get_tags

  private

  def get_featured_articles
    @featured_articles = Article.all
  end

  def get_relational_articles
    @relational_articles = Article.all
  end

  def get_recent_articles
    @recent_articles = Article.all
  end

  def get_tags
    @tags = Tag.all
  end

end
