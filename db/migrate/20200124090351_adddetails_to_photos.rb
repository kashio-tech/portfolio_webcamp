class AdddetailsToPhotos < ActiveRecord::Migration[5.2]
  def change
  	add_column :photos, :camera_id,	:integer
  	add_column :photos, :lense_id,	:integer
  end
end
