class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.string :city
      t.text :description
      t.string :venue
      t.string :price
      t.string :image
      t.boolean :free
      t.date :start_time
      t.date :end_time
      t.string :performer

      t.timestamps
    end
  end
end
