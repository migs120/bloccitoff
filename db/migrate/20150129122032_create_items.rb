class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name
      t.references :lists, index: true

      t.timestamps
    end
  end
end
