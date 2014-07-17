class Article < ActiveRecord::Base
	 validates :title, presence: true,
                    length: { minimum: 5 }
                      has_many :comments
  validates :title, presence: true,
                    length: { minimum: 5 }
end
