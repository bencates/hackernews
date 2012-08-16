class Story < ActiveRecord::Base
  attr_accessible :title, :url, :created_at

  validates_presence_of :title, :url
  validates_uniqueness_of :url

  def url_domain
    URI(url).host
  end

  def upvote
    self.karma += 1
    save
  end
end
