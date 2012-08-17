class StoriesController < ApplicationController
  respond_to :html, :json

  # GET /
  # GET /index.json
  def index
    if params[:sort] && params[:sort].to_sym == :new
      @stories = Story.all
    else
      @stories = Story.find :all, order: 'karma DESC'
    end

    respond_with @stories
  end

  # GET /1
  # GET /1.json
  def show
    @story = Story.find(params[:id])

    respond_with @story
  end

  # GET /new
  # GET /new.json
  def new
    @story = Story.new

    respond_with @story
  end

  # GET /1/edit
  def edit
    @story = Story.find(params[:id])
  end

  # POST /
  # POST /index.json
  def create
    @story = Story.new(params[:story])

    respond_to do |format|
      if @story.save
        format.html { redirect_to @story, notice: 'Story was successfully created.' }
        format.json { render json: @story, status: :created, location: @story }
      else
        format.html { render action: "new" }
        format.json { render json: @story.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /1
  # PUT /1.json
  def update
    @story = Story.find(params[:id])

    respond_to do |format|
      if @story.update_attributes(params[:story])
        format.html { redirect_to @story, notice: 'Story was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @story.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /1
  # DELETE /1.json
  def destroy
    @story = Story.find(params[:id])
    @story.destroy

    respond_to do |format|
      format.html { redirect_to stories_url }
      format.json { head :no_content }
    end
  end

  # POST /1/upvote
  # POST /1/upvote.json
  def upvote
    @story = Story.find(params[:id])
    @story.upvote

    respond_to do |format|
      format.html { redirect_to stories_url }
      format.json { head :no_content }
    end
  end
end
