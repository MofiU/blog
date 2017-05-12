class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :get_featured_articles
  before_action :get_relational_articles
  before_action :get_recent_articles
  before_action :get_tags

  private

  def get_featured_articles
    articles = [{title: 'Clean - Responsive HTML5 Template' },{ title: 'Responsive Pricing Table' },{ title: 'Yellow HTML5 Template' }]
    @featured_articles = JSON.parse(articles.to_json, object_class: OpenStruct)
  end

  def get_relational_articles
    articles = [{title: 'Clean - Responsive HTML5 Template' },{ title: 'Responsive Pricing Table' },{ title: 'Yellow HTML5 Template' },
      {title: 'Blackor Responsive Theme' }, {title: 'Portfolio Bootstrap Template' }, {title: 'Clean Slider Template' }]
    @relational_articles = JSON.parse(articles.to_json, object_class: OpenStruct)
  end

  def get_recent_articles
    articles = [{title: 'Clean - Responsive HTML5 Template' },{ title: 'Responsive Pricing Table' },{ title: 'Yellow HTML5 Template' },
      {title: 'Blackor Responsive Theme' }, {title: 'Portfolio Bootstrap Template' }, {title: 'Clean Slider Template' }]
    @recent_articles = JSON.parse(articles.to_json, object_class: OpenStruct)
  end

  def get_tags
    @tags = Tag.all
  end

end
