class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.string :name, null: false
      t.string :internal_code, null: false
      t.integer :stock, null: false, default: 0

      t.timestamps
    end
  end
end
