class CreatePrograms < ActiveRecord::Migration[6.0]
  def change
    create_table :programs do |t|
      t.string :title
      t.string :category
      t.string :platform
      t.string :description
      t.string :url_image
      t.integer :length
      t.integer :age_range

      t.timestamps
    end
  end
end
