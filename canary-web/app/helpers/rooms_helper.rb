module RoomsHelper
	def room_thumb(room)
		room.attachments.first.attach_url unless room.attachments.empty?
		new AttachmentUploader().default_url
	end
end
