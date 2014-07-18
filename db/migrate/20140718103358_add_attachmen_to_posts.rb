class AddAttachmenToPosts < ActiveRecord::Migration

  def change
  	add_column :articles, :attachment_file_name, :string
	add_column :articles, :attachment_content_type, :string
	add_column :articles, :attachment_file_size, :integer
	add_column :articles, :attachment_updated_at, :datetime
  end
end
