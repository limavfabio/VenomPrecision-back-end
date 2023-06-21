class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :username, null: false, unique: true
      t.string :photo, null: false, default: "https://simg.nicepng.com/png/small/933-9332131_profile-picture-default-png.png"

      t.timestamps
    end
  end
end
