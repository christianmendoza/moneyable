class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :category_name
      t.references :parent

      t.timestamps
    end
  end
end
