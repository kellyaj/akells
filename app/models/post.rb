class Post < ActiveRecord::Base
  attr_accessible :content, :title, :tag_list

  belongs_to :user
  acts_as_taggable

  before_save :parse_text

  acts_as_url :title

  def parse_text
  	self.content = RedCloth.new(content).to_html
  end

  def to_param
  	url
  end
end
