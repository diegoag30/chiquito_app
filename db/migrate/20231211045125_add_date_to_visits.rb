class AddDateToVisits < ActiveRecord::Migration[7.1]
  def change
    add_column :visits, :date, :datetime
  end
end
