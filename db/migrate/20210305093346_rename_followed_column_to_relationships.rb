class RenameFollowedColumnToRelationships < ActiveRecord::Migration[5.2]
  def change
    rename_column :relationships, :follower, :follower_id
  end
end
