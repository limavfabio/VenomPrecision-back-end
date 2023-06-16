class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :name, null: false
      t.text :description
      t.references :owner, foreign_key: { to_table: :users }, index: true

      t.timestamps
    end
  end
end

