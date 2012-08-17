module StoriesHelper
  def statusline(story)
    score = pluralize story.karma, 'point'
    age = time_ago_in_words story.created_at
    "#{score} #{age} ago"
  end
end
