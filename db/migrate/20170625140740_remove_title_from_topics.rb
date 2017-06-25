class RemoveTitleFromTopics < ActiveRecord::Migration
  def change
    remove_column :topics, :title, :string
  end
end
