class PageController < ApplicationController
  def index
    @pages = Page.all.map { |page| PageDecorator.new(page, view_context) }
  end

  def create
    @page = Page.new(page_params)
    if !@page.save
      @errors = @page.errors
    end
    redirect_to action: :index
  end

  def show
    page = Page.find(params[:id])
    @page = PageDecorator.new(page, view_context)
  end

  private

  def page_params
    params.require(:page).permit(:identity)
  end
end
