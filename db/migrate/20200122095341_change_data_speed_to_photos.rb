class ChangeDataSpeedToPhotos < ActiveRecord::Migration[5.2]
  def change
  	change_column	:photos, :speed, :string
  end
end
