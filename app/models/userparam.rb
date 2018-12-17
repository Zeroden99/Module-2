class Userparam < ApplicationRecord
    belongs_to :user

    has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/assets/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/

  validates :age, length: { in: 18..65 }
  validates :firstname, :lastname, :age , presence: true
end
