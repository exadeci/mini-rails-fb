module ApplicationHelper
  HASHTAG_REGEX = /(?:\s|^)(?:#(?!(?:\d+|\w+?_|_\w+?)(?:\s|$)))(\w+)(?=\s|$)/
  HASHTAG_URL = 'https://www.facebook.com/hashtag/'

  def with_hashtags(content)
    content.gsub(HASHTAG_REGEX) { |hashtag| format_hashtag(hashtag) }
           .html_safe
  end

  private

  def format_hashtag(hashtag)
    "<a href=\"#{HASHTAG_URL}#{hashtag.parameterize}\">#{hashtag}</a>"
  end
end
