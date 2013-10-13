class PostCard < ActiveRecord::Base
  include Lobable

  mount_uploader :picture, PictureUploader

  before_save :build_address

  validates :name, :address_line1, :city, :state, :zip, :country, presence: true

  def paid?
    paid
  end

  private

  def build_address
    address = @lob.addresses.create(
      name: name,
      address_line1: address_line1,
      address_line2: address_line2,
      city: city,
      state: state,
      zip: zip,
      country: country
    )
    self.address_id = address['id']
  end

  def print!
    if paid?
      job = @lob.postcards.create(
        name,
        address_id,
        message: message,
        front: "https://dl.dropboxusercontent.com/u/15606280/postcard_postcard_post_card.pdf"
      )
      self.job_id = job['id']
      self.save
    end
  end
end
