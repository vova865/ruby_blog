class AddImageDataToArticles < ActiveRecord::Migration[7.0]
  def change
    add_column :articles, :image_data, :text
  end
end
