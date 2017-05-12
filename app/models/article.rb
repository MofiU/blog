class Article < ApplicationRecord
  include Bootsy::Container
  has_many :comments
  belongs_to :tag, counter_cache: true

  validates_presence_of :title
  validates_presence_of :meta
  validates_presence_of :body
end
