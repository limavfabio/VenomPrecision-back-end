class CreatePackages < ActiveRecord::Migration[7.0]
  def change
    create_table :packages do |t|
      t.string :name, null: false
      t.text :description
      t.text :image, null: false

      t.timestamps
    end
  end
end
