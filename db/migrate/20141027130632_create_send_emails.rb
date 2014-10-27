class CreateSendEmails < ActiveRecord::Migration
  def change
    create_table :send_emails do |t|
      t.string :song
      t.string :artist
      t.string :link
      t.string :note
      t.string :to

      t.timestamps
    end
  end
end
