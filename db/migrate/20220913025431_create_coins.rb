class CreateCoins < ActiveRecord::Migration[7.0]
  def change
    create_table :coins, id: :uuid do |t|
      t.string :name
      t.string :asset_id
      t.boolean :type_is_crypto
      t.date :data_start
      t.date :data_end
      t.float :price

      t.timestamps
    end
  end
end
