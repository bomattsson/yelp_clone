class Restaurant < ActiveRecord::Base
  has_many :reviews, dependent: :destroy
  validates :name, length: {minimum: 3}, uniqueness: {message: "Name already exists"}

  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

  def average_rating
    return 'N/A' if reviews.none?
    reviews.average(:rating)
  end
end


#
# RSpec::Matchers.define :exist_in_database do
#   match do /actual/
#   actual.class.exists?(actual.id)
#   restaurant = Restaurant.create(name: 'hey')
#   end
# end
