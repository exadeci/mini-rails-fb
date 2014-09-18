Feed = Struct.new(:name, :picture, :message, :link, :comment_link, :updated_time)

class PageDecorator < BaseDecorator
  def name
    raw['name']
  end

  def picture
    return '' if raw['picture'].nil?

    raw['picture']['url']
  end

  def cover
    return '' if raw['cover'].nil?

    raw['cover']['source']
  end

  def feeds
    raw['feeds'].map do |feed|
      Feed.new(feed['from']['name'],
               feed['picture'],
               feed['message'],
               feed['link'] || '',
               feed['actions'][0]['link'],
               h.time_ago_in_words(feed['updated_time']))
    end
  end

  def likes
    return '' if raw['likes'].nil?

    raw['likes']
  end

  def link
    return '' if raw['link'].nil?

    raw['link']
  end

  private

  def raw
    JSON.parse(data)
  end
end
