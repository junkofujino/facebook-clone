class AddTitleToTopics < ActiveRecord::Migration
  def change
    add_column :topics, :title, :string
    add_column :topics, :content, :text
  end
end
