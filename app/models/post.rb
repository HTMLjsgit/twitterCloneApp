class Post < ApplicationRecord
	mount_uploader :image, ImageUploader
	mount_uploader :video, VideoUploader
	acts_as_taggable
end
