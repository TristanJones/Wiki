class WikiPage < ActiveRecord::Base
  attr_accessible :content, :created_by, :creation_date, :title
end

def self.search(search)
  if search
    find(:all, :conditions => ['title LIKE ?', "%#{search}%"])
  else
    find(:all)
  end
end