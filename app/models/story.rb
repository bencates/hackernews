class Story < ActiveRecord::Base
  attr_accessible :title, :url

  validates_presence_of :title, :url
  validates_uniqueness_of :url

  def url_domain
    URI(url).host
  end
end
