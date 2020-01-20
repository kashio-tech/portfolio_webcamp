class AddCameraMakerToPhotos < ActiveRecord::Migration[5.2]
  def change
    add_column :photos, :camera_maker, :string
  end
end
