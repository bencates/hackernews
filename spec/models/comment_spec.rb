require 'spec_helper'

describe Comment do
  subject { create :comment }

  it { should validate_presence_of :body }

  it { should belong_to :story }
end
