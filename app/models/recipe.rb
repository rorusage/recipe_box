class Recipe < ActiveRecord::Base
  has_many :ingredients, :dependent => :destroy
  has_many :steps, :dependent => :destroy
  accepts_nested_attributes_for :ingredients, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :steps, reject_if: :all_blank, allow_destroy: true
  validates :title, presence: true
  validates :content, presence: true

  belongs_to :owner, class_name: "User", foreign_key: :user_id

  has_many :comments, :dependent => :destroy


  def editable_by?(user)
    user == owner
  end
end
