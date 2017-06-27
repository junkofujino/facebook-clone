class RenameAvatarColumnToTopics < ActiveRecord::Migration
  def change
    rename_column :topics, :avatar, :picture
  end
end
