class CommentsController < ApplicationController
  # POST /:story_id/comments
  # POST /:story_id/comments.json
  def create
    @story = Story.find(params[:story_id])
    @comment = @story.comments.build(params[:comment])

    respond_to do |format|
      if @comment.save
        format.html { redirect_to @story, notice: 'Comment was successfully created.' }
        format.json { render json: @story, status: :created, location: @story }
      else
        format.html { redirect_to @story, alert: 'Comment was not created.' }
        format.json { render json: @story.errors, status: :unprocessable_entity }
      end
    end
  end
end
