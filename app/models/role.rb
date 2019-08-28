# == Schema Information
#
# Table name: roles
#
#  id         :bigint           not null, primary key
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Role < ApplicationRecord
  has_many :people, dependent: :destroy

  scope :person_role, ->(name) {find_by(name: name)}
end
