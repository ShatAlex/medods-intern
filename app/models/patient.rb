class Patient < ApplicationRecord
    validates :name, presence: true
    validates :surname, presence: true
    validates :birth_date, presence: true
end
