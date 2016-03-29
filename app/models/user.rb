# == Schema Information
#
# Table name: users
#
#  id       :integer          not null, primary key
#  username :string           not null
#

class User < ActiveRecord::Base
  validates :username, presence: true, uniqueness: true

  has_many :contacts,
  foreign_key: :user_id,
  primary_key: :id,
  class_name: :Contact,
  dependent: :destroy

  has_many :contact_shares,
  foreign_key: :user_id,
  primary_key: :id,
  class_name: :ContactShare,
  dependent: :destroy


end
