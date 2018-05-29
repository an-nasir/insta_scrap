class CreateWebSettings < ActiveRecord::Migration[5.2]
  def change
    create_table :web_settings do |t|
      t.integer :post_min
      t.integer :post_max

      t.timestamps
    end
  end
end
