class Comment < ActiveRecord::Base
  include Karma

  belongs_to :story
  attr_accessible :body

  validates_presence_of :body
end
