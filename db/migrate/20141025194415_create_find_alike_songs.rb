class CreateFindAlikeSongs < ActiveRecord::Migration
  def change
    create_table :find_alike_songs do |t|

      t.timestamps
    end
  end
end
