class CreateCategoryEvents < ActiveRecord::Migration
  def change
    create_table :category_events do |t|
      t.references :category, index: true
      t.references :event, index: true

      t.timestamps
    end
  end
end
