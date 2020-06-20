class Post < ApplicationRecord
    
    mount_uploader :bodyone, FileUploader
    mount_uploader :bodytwo, FileUploader
    # validates :bodyone, presence: true
    # validates :bodytwo, presence: true
    validates :bodyone, presence: true, file_content_type: { allow: ['text/plain'] } ,file_size: { greater_than: 1.byte }
    validates :bodytwo, presence: true, file_content_type: { allow: ['text/plain'] } ,file_size: { greater_than: 1.byte }
    
end
