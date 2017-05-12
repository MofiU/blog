class AdminController < ApplicationController
  before_action :authenticate_user!, except: :show
  before_action :get_articles, only: :dashboard

  def dashboard

  end

  private

  def get_articles
    articles = [{title: 'Clean - Responsive HTML5 Template' },{ title: 'Responsive Pricing Table' },{ title: 'Yellow HTML5 Template' },{title: 'Clean - Responsive HTML5 Template' },{ title: 'Responsive Pricing Table' },{ title: 'Yellow HTML5 Template' },{title: 'Clean - Responsive HTML5 Template' },{ title: 'Responsive Pricing Table' },{ title: 'Yellow HTML5 Template' },{title: 'Clean - Responsive HTML5 Template' },{ title: 'Responsive Pricing Table' },{ title: 'Yellow HTML5 Template' }]
    @articles = JSON.parse(articles.to_json, object_class: OpenStruct)
  end

end
