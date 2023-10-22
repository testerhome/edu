class TrainingCourse < ApplicationRecord
    include SoftDelete  
    enum courseType: %i(公开课 技能提升)
    counter :hits
    validates :title, :cover, :author, :description, :courseType, :price, :courseUrlOfXiaoETong, presence: true
    mount_uploader :cover, PhotoUploader
    scope :suggested,  -> { where('suggested IS True').order(created_at: :desc) }
    scope :published,  -> { where('published IS True').order(created_at: :desc) }
end

