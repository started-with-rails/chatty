class CreateRooms < ActiveRecord::Migration[6.0]
  def change
    create_table :rooms do |t|
      t.string :name
      t.references :owner
      t.boolean :status
      t.timestamps
    end
  end
end
