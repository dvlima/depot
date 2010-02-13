class Product < ActiveRecord::Base
  validates_presence_of(:title, :description, :image_url)
  validates_numericality_of(:price, :message => "must be a number")
  validates_uniqueness_of(:title, :message => "already existe")  
  validates_length_of(:title, :minimum => 10, :message => "should be at least 10 characther")  
  validates_format_of(:image_url, :with => %r{\.(gif|jpg|png)$}i, :message => "must be a URL for GIF, JPG or PNG image.(gif|jpg|png)")
  validate :price_must_be_bigger_then_one
  
  def self.find_products_for_sale
    find(:all, :order => "title" )
  end
  
  protected
  def price_must_be_bigger_then_one
    errors.add(:price, 'should be at least $1.00') if price.nil?||price < 1
  end  
  
end
