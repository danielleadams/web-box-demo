class AddLabelColumns < ActiveRecord::Migration[5.0]
  def change
    add_column :labels, :name, :string
    add_column :labels, :position, :string
  end
end
