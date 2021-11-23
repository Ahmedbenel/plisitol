class CreatePrograms < ActiveRecord::Migration[6.0]
  def change
    create_table :programs do |t|
      t.string :title
      t.string :category
      t.string :description
      t.string :url_image
      t.string :program_url
      t.integer :length
      t.integer :min_age
      t.integer :max_age
      t.references :platform, null: false, foreign_key: true

      t.timestamps
    end
  end
end
