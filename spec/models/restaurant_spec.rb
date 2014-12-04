require 'rails_helper'

describe Restaurant do
  it "requires a name" do
     should validate_presence_of(:name)
  end
end
