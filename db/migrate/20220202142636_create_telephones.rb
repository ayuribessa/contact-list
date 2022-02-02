class CreateTelephones < ActiveRecord::Migration[7.0]
  def change
    create_table :telephones do |t|
      t.string :number, null: false
      t.string :type, null: false
      t.boolean :main, null: false
      t.references :contact, null: false, foreign_key: true

      t.timestamps
    end
  end
end
