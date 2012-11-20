class AddStateToBanner < ActiveRecord::Migration
  def change
    add_column :banners, :state, :string
    remove_column :banners, :is_open
  end
end
