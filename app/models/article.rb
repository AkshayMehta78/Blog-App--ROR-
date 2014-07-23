class Article < ActiveRecord::Base
	validates :title, presence: true,
                    length: { minimum: 5 }
    has_many :comments
    belongs_to :user
    has_attached_file :attachment,
    	:styles => {
		  :thumb    => ['100x100#',  :jpg, :quality => 70],
		  :medium	=> ['480x480#',  :jpg, :quality => 70],
		  :preview  => ['480x480#',  :jpg, :quality => 70],
		  :large    => ['600>',      :jpg, :quality => 70],
		  :retina   => ['1200>',     :jpg, :quality => 30]
			}
	validates_attachment_content_type :attachment, :content_type => /\Aimage\/.*\Z/
	acts_as_taggable_on :tags


end
