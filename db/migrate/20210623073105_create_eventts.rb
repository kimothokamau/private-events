class CreateEventts < ActiveRecord::Migration[6.1]
  def change
    create_table :eventts do |t|
      t.text :description
      t.text :title
      t.integer :creator_id

      t.timestamps
    end
  end
end
