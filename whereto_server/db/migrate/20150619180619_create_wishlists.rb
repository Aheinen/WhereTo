class CreateWishlists < ActiveRecord::Migration
  def change
    create_table :wishlists do |t|
      t.references :event, index: true
      t.references :user, index: true
      t.boolean :accepted

      t.timestamps
    end
  end
end
