class AddUserIdToLinks < ActiveRecord::Migration[7.1]
  def change
    add_reference :links, :user, foreign_key: true, index: true
  end
end
