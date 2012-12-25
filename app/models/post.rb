class Post < ActiveRecord::Base
  attr_accessible :content, :title, :tag_list

  belongs_to :user
  acts_as_taggable

  before_save :parse_text

  def parse_text
  	self.content = RedCloth.new(content).to_html
  end
end
