class CreateBanners < ActiveRecord::Migration
  def change
    create_table :banners do |t|
      t.string :title
      t.string :desc
      t.string :link
      t.string :link_text
      t.boolean :is_open
      t.date :start_date
      t.date :stop_date

      t.timestamps
    end
  end
end
