class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name
      t.money :cost
      t.string :country_of_origin

      t.timestamps
    end
  end
end
