class Comment < ActiveRecord::Base
  include Karma

  belongs_to :commentable, polymorphic: true
  has_many :comments, as: :commentable
  attr_accessible :body

  validates_presence_of :body
end
