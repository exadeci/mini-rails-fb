class Page < ActiveRecord::Base
  before_validation :fetch

  validates :identity, presence: true,
                       uniqueness: true
	                     
  validates :data, presence: true

  private

  def fetch
    fetched = FacebookGraph.fetch(identity)
      
    return if fetched.empty?
      
    self.data = fetched.to_json
  end
end
