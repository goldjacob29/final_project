class CreateSongInstances < ActiveRecord::Migration
  def change
    create_table :song_instances do |t|
      t.integer :song_id
      t.integer :playlist_id

      t.timestamps

    end
  end
end
