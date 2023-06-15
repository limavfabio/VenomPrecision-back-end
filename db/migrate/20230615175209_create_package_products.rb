class CreatePackageProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :package_products do |t|
      t.integer :quantity, default: 1
      t.references :product, null: false, foreign_key: true, index: true
      t.references :package, null: false, foreign_key: true, index: true

      t.timestamps
    end
  end
end
