class Api::TagsController < ApplicationController

  def index
    @tags = Tag.all
    render "index.json.jb"
  end

  def show
    tag_id = params[:id]
    @tag = Tag.find_by(id: tag_id)
    render "show.json.jb"
  end

end
