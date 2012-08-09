class Attachment < ActiveRecord::Base
  attr_accessible :attach, :attachmentable_id, :attachmentable_type, :content_type, :file_name, :file_size
  attr_accessible :attachmentable
  
  mount_uploader :attach, AttachmentUploader
  
  belongs_to :attachmentable, :polymorphic => true
  
  validates :attach, :presence => true
  
  before_save :save_attachment_attributes
  
  protected
  def save_attachment_attributes
    self.content_type = attach.file.content_type
    self.file_name = attach.file.original_filename
    self.file_size = attach.file.size
  end 
end
