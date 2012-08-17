class Story < ActiveRecord::Base
  include Karma

  has_many :comments
  attr_accessible :title, :url, :created_at

  validates_presence_of :title, :url
  validates_uniqueness_of :url

  def url_domain
    URI(url).host
  end
end
