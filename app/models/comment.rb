class Comment < ApplicationRecord
  belongs_to :article, counter_cache: true
  validates_presence_of :visitor_name
  validates_presence_of :email
end
