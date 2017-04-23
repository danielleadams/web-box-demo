class CreateLabels < ActiveRecord::Migration[5.0]
  def change
    create_table :labels do |t|
      t.column :name, :string
      t.column :position, :string

      t.timestamps
    end
  end
end
