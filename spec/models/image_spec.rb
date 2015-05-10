require 'rails_helper'

describe Image do

  it { should validate_attachment_content_type(:source_file).
      allowing('image/png', 'image/gif', 'image/jpg', 'image/jpeg').
      rejecting('text/plain', 'text/xml') }
end
