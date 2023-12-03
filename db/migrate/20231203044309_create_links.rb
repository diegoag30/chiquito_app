class CreateLinks < ActiveRecord::Migration[7.1]
  def change
    create_table :links do |t|
      t.string :public_url
      t.string :slug
      t.string :password_digest
      t.string :type
      t.datetime :expiration_date
      t.boolean :active

      t.timestamps
    end
    add_index :links, :type
  end
end
