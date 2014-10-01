require 'rails_helper'

RSpec.describe PageController, :type => :controller do
	  it "adds FacebookFrance page to the list" do
    page = Page.new('FacebookFrance')
    expect{page}.to change{Page.count}.from(0).to(1)
  end

end
