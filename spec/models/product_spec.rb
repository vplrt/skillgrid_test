require 'rails_helper'

describe Product do
  it "has a valid factory" do
    expect(build(:product)).to be_valid
  end

  it { is_expected.to validate_presence_of :title }
  it { is_expected.to validate_presence_of :description }

  it { should have_attached_file(:image) }
  it { should validate_attachment_content_type(:image).
              allowing('image/png', 'image/gif', 'image/jpeg').
              rejecting('text/plain', 'text/xml', 'some_image/png') }

  it { should belong_to :seller }

end
