class CreateRooms < ActiveRecord::Migration[6.1]
  def change
    create_table :rooms do |t|
      t.string "name"
      t.string "introduction"
      t.integer "price"
      t.integer "user_id"
    
      t.string "address"
      t.string "image"
    
      t.timestamps
    end
  
  end
end

def up
  add_column :room, :'image',:string
end