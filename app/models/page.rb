class Page < ActiveRecord::Base
  attr_accessible :content, :created_by, :creation_date, :title

  validates :title, :content, :presence => true
  validates :title, :uniqueness => true

	def self.search(search)
  		if search
    		find(:all, :conditions => ['title LIKE ?', "%#{search}%"])
  		else
    		find(:all)
  		end
	end
end
