class CreatePhotos < ActiveRecord::Migration[5.2]
  def change
    create_table :photos do |t|

    t.integer	:user_id
    t.integer	:category_id
    t.string	:image_id
    t.string	:title
    t.text		:caption
    t.float		:latitude
    t.float		:longitude
    t.datetime	:taken_at
    t.float		:speed
    t.string	:f_number
    t.string	:iso_speed
    t.string	:white_balance

      t.timestamps
    end
  end
end
