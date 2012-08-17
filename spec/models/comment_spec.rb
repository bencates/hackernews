require 'spec_helper'

describe Comment do
  subject { create :comment }

  it { should validate_presence_of :body }

  it { should belong_to :story }

  it "should be able to be upvoted" do
    expect { subject.upvote }.to change(subject, :karma).by(1)
  end
end
