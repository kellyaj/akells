class Post < ActiveRecord::Base
  attr_accessible :content, :title, :tag_list

  belongs_to :user
  acts_as_taggable
end
