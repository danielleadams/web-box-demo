class AddStatusToLabels < ActiveRecord::Migration[5.0]
  def change
    add_column :labels, :status, :string
  end
end
