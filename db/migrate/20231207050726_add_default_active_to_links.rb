class AddDefaultActiveToLinks < ActiveRecord::Migration[7.1]
  def change
    change_column_default(:links, :active, true)
  end
end
