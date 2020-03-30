class Resume < ApplicationRecord
    mount_uploader :attachment, ResumeUploader # Tells rails to use this uploader for this model.
    validates :attachment, presence: true
end
