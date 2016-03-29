# == Schema Information
#
# Table name: contacts
#
#  id      :integer          not null, primary key
#  name    :string           not null
#  email   :string           not null
#  user_id :integer          not null
#

class Contact < ActiveRecord::Base
  validates :user_id, :email, :name, presence: true
  validates :email, uniqueness: {scope: :user_id}


  belongs_to(
  :owner,
  class_name: :User,
  foreign_key: :user_id,
  primary_key: :id
  )

  has_many :contact_shares,
  foreign_key: :contact_id,
  primary_key: :id,
  class_name: :ContactShare
end
