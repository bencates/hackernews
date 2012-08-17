class CommentsController < ApplicationController
  respond_to :html, :json
 
  # GET /1/comments/1
  # GET /1/comments/1.json
  def show
    @comment = Comment.find(params[:id])

    respond_with @comment
  end

  # POST /1/comments
  # POST /1/comments.json
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

  # POST /1/comments/1/upvote
  # POST /1/comments/1/upvote.json
  def upvote
    @story = Story.find(params[:story_id])
    @comment = @story.comments.find(params[:id])
    @comment.upvote

    respond_to do |format|
      format.html { redirect_to story_url @story }
      format.json { head :no_content }
    end
  end
end
