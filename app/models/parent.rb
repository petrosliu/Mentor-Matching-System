class Parent < ActiveRecord::Base
    has_many :children
    belongs_to :user
    has_many :groups
    has_many :invitations
end
