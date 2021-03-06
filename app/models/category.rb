class Category < ActiveRecord::Base
  #attr_accessible :category_name
  has_many :subcategories, class_name: "Category", foreign_key: "parent_id", dependent: :destroy
  belongs_to :parent_category, class_name: "Category"
  has_many :transactions, dependent: :destroy
end
