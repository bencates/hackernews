require 'spec_helper'

describe Story do
  subject { create :story }

  it { should validate_presence_of :title }
  it { should validate_presence_of :url }
  it { should validate_uniqueness_of :url }

  it "should find the domain of a URL" do
    story = build :story, url: "http://foo.bar.com/asdf?jkl=123"
    story.url_domain.should == 'foo.bar.com'
  end

  it "should be able to be upvoted" do
    expect { subject.upvote }.to change(subject, :karma).by(1)
  end
end
