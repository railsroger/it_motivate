class Post < ApplicationRecord
    validates :title, presence: true
    validates :body, presence: true

    scope :sorted, -> { order(published_at: :desc, updated_at: :desc) }
    scope :published, -> { where("published_at <= ?", Time.current) }
    

    def published?
        published_at? && published_at <= Time.current
    end

end
