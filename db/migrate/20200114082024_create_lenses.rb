class CreateLenses < ActiveRecord::Migration[5.2]
  def change
    create_table :lenses do |t|

    	t.integer	:user_id
    	t.string	:maker
    	t.string	:model

      t.timestamps
    end
  end
end
