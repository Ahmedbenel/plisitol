class AddUrlIconToPlatforms < ActiveRecord::Migration[6.0]
  def change
    add_column :platforms, :url_icon, :string
  end
end
