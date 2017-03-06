class Step < ActiveRecord::Base
  belongs_to :recipe
  validates :step_order, presence: true
  validates :content, presence: true
end
