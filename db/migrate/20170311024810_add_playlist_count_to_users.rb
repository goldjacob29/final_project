class AddPlaylistCountToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :playlists_count, :integer
  end
end
