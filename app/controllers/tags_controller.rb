class TagsController < ApplicationController
  #GET /tags/:keyword
  def list
    tag = Tag.find_by(keyword: params[:keyword])
    @places = tag.places
  end
end
