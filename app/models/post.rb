class Post < ApplicationRecord
    validates :title, presence: true
    validates :content, length: {minimum: 250}
    validates :summary, length: {maximum: 250}
    validates :category, inclusion: {in: ["Fiction", "Non-Fiction"]}

    validate :cannot_be_true_facts

    def cannot_be_true_facts
        if title =="True Facts"
            errors.add(:title, "The title can't be 'True Facts.'")
        end
    end
end
