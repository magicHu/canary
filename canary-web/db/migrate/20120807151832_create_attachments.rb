class CreateAttachments < ActiveRecord::Migration
  def change
    create_table :attachments do |t|
      t.string :file_name
      t.string :content_type
      t.integer :file_size
      t.string :attachmentable_type
      t.integer :attachmentable_id
      t.string :attach

      t.timestamps
    end
  end
end
