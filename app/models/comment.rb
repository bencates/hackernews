class Comment < ActiveRecord::Base
  belongs_to :story
  attr_accessible :body, :karma

  validates_presence_of :body
end
