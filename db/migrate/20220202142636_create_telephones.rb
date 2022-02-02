class CreateTelephones < ActiveRecord::Migration[7.0]
  def change
    create_table :telephones do |t|
      t.string :number
      t.string :type
      t.boolean :main
      t.references :contact, null: false, foreign_key: true

      t.timestamps
    end
  end
end
