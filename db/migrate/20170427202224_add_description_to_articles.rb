class AddDescriptionToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :description, :text #adds column description which is of type text to the table articles
    add_column :articles, :created_at, :datetime #Creates a created at timestamp MUST BE CALLED created_at
    add_column :articles, :updated_at, :datetime #Creates an updated at timestamp MUST BE CALLED updated_at
  end
end
