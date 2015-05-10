class Image < ActiveRecord::Base

  belongs_to :item

  has_attached_file(
    :source_file,
    styles: { :"150" => "x150", :"300" => "x300" },
    s3_protocol: :https,
    storage: :s3,
    bucket: ENV["AWS_S3_BUCKET"],
    url: ":s3_domain_url",
    path: "items/:item_id/images/:id/:style/:filename"
  )

  validates_attachment_content_type :source_file, :content_type => /\Aimage\/.*\Z/

  def thumbnail
    source_file.url(:"150")
  end

  def original_style
    source_file.url
  end

private
  Paperclip.interpolates :user_id do |attachment, style|
    attachment.instance.user.id.to_s
  end

end
