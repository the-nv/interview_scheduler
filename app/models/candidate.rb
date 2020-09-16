class Candidate < ApplicationRecord
    has_many :interviews

    validates :name, presence: true

    validates :email, format: { with: URI::MailTo::EMAIL_REGEXP } 
end
