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
    if params[:comment_id]
      @parent = Comment.find(params[:comment_id])
    else
      @parent = Story.find(params[:story_id])
    end
    @comment = @parent.comments.build(params[:comment])

    respond_to do |format|
      if @comment.save
        format.html { redirect_to @parent, notice: 'Comment was successfully created.' }
        format.json { render json: @parent, status: :created, location: @parent }
      else
        format.html { redirect_to @parent, alert: 'Comment was not created.' }
        format.json { render json: @parent.errors, status: :unprocessable_entity }
      end
    end
  end

  # POST /1/comments/1/upvote
  # POST /1/comments/1/upvote.json
  def upvote
    @comment = Comment.find(params[:id])
    @comment.upvote

    respond_to do |format|
      format.html { redirect_to :back }
      format.json { head :no_content }
    end
  end
end
