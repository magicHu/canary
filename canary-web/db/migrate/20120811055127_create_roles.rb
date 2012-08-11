class CreateRoles < ActiveRecord::Migration
  def change
    create_table :roles do |t|
      t.string :name
      t.string :desc

      t.timestamps
    end
    
    create_table :roles_users, :id => :false do |t|
      t.integer :role_id
      t.integer :user_id
    end
    
    add_index(:roles_users, [:user_id, :role_id], :unique => true)
    add_index(:roles_users, [:user_id])
  end
end
