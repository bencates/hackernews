require 'spec_helper'

describe CommentsController do

  before(:each) do
    @story = create :story
    @comment = create :comment, story: @story
  end

  # This should return the minimal set of attributes required to create a valid
  # Story. As you add validations to Story, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    {body: "I'm a comment!"}
  end

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # StoriesController. Be sure to keep this updated too.
  def valid_session
    {}
  end

  describe "GET show" do
    it "assigns the requested comment as @comment" do
      get :show, { id: @comment.to_param }, valid_session
      assigns(:comment).should eq(@comment)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Comment" do
        expect {
          post :create, {story_id: @story.to_param, comment: valid_attributes}, valid_session
        }.to change(@story.comments, :count).by(1)
      end

      it "assigns a newly created comment as @comment" do
        post :create, {story_id: @story.to_param, comment: valid_attributes}, valid_session
        assigns(:comment).should be_a(Comment)
        assigns(:comment).should be_persisted
      end

      it "redirects to the parent story" do
        post :create, {story_id: @story.to_param, comment: valid_attributes}, valid_session
        response.should redirect_to(@story)
        flash[:notice].should_not be_empty
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved comment as @comment" do
        # Trigger the behavior that occurs when invalid params are submitted
        Comment.any_instance.stub(:save).and_return(false)
        post :create, {story_id: @story.to_param, comment: {}}, valid_session
        assigns(:comment).should be_a_new(Comment)
      end

      it "redirects to the parent story with an alert" do
        # Trigger the behavior that occurs when invalid params are submitted
        Comment.any_instance.stub(:save).and_return(false)
        post :create, {story_id: @story.to_param, comment: {}}, valid_session
        response.should redirect_to(@story)
        flash[:alert].should_not be_empty
      end
    end
  end

  describe "POST upvote" do
    before(:each) do
      request.env["HTTP_REFERER"] = 'original_url'
    end

    it "increments the comment's karma" do
      expect {
        post :upvote, { id: @comment.to_param }, valid_session
        @comment.reload
      }.to change(@comment, :karma).by(1)
    end

    it "redirects to the referrer" do
      post :upvote, { id: @comment.to_param }, valid_session
      response.should redirect_to 'original_url'
    end
  end
end
