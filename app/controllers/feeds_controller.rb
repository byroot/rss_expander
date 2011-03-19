class FeedsController < ApplicationController
  
  def show
    if params[:id] == 'custom'
      @feed = Feed.new(params.slice(:url, :selector))
    else
      @feed = Feed.find_by_name!(params[:id])
    end
    render :text => expand_feed
  end
  
  protected
  
  def expand_feed
    @document = Nokogiri::XML(open(@feed.url))
    @document.css('item').each do |item|
      link = item.at_css('link').content
      web_page = Nokogiri::HTML(open(link))
      description = web_page.at_css(@feed.selector).try(:content)
      item.at_css('description').content = description if description.present?
    end
    @document
  end
  
end