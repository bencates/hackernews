module Karma
  def upvote
    self.karma += 1
    save
  end
end
