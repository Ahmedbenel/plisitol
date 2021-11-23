class CreateChildrenWatchings < ActiveRecord::Migration[6.0]
  def change
    create_table :children_watchings do |t|
      t.references :child, null: false, foreign_key: true
      t.references :watching, null: false, foreign_key: true

      t.timestamps
    end
  end
end
