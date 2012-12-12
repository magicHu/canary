class Comment < ActiveRecord::Base
	attr_accessible :title, :comment, :commentable_id, :commentable_type

  include ActsAsCommentable::Comment

  belongs_to :commentable, :polymorphic => true

  default_scope :order => 'created_at ASC'

  validates :title, :comment, :presence => true

  # NOTE: install the acts_as_votable plugin if you
  # want user to vote on the quality of comments.
  #acts_as_voteable

  # NOTE: Comments belong to a user
  belongs_to :user
end
