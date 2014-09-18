module FacebookGraph
  extend self

  ACCESS_TOKEN = ENV["FBGRAPH_ACCESS_TOKEN"]

  def fetch(id)
    begin
      page = FbGraph2::Page.fetch(id, access_token: ACCESS_TOKEN)
      
      feeds = page.feed(access_token: ACCESS_TOKEN, limit: 10).map do |feed|
        feed.raw_attributes
      end
     
      page.raw_attributes.merge({ 
        feeds: feeds,
        picture: page.picture.raw_attributes
      })
    rescue FbGraph2::Exception::InvalidRequest 
      {}
    end
  end
end
