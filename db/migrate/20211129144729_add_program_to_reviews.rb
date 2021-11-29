class AddProgramToReviews < ActiveRecord::Migration[6.0]
  def change
    add_reference :reviews, :program, null: false, foreign_key: true
  end
end
