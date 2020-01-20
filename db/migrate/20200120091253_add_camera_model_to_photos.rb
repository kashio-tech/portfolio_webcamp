class AddCameraModelToPhotos < ActiveRecord::Migration[5.2]
  def change
    add_column :photos, :camera_model, :string
  end
end
