class AddDetailsToPhotos < ActiveRecord::Migration[5.2]
  def change
    add_column :photos, :lense_maker, :string
    add_column :photos, :lense_model, :string
  end
end
