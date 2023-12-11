class RemoveHostFromVisits < ActiveRecord::Migration[7.1]
  def change
    remove_column :visits, :host, :string
  end
end
