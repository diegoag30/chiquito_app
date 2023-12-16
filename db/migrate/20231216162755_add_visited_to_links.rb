class AddVisitedToLinks < ActiveRecord::Migration[7.1]
  def change
    add_column :links, :visited, :integer, default: 0
  end
end
