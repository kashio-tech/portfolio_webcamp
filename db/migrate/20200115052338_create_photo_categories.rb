class CreatePhotoCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :photo_categories do |t|

      t.timestamps
    end
  end
end
