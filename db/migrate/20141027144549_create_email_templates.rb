class CreateEmailTemplates < ActiveRecord::Migration
  def change
    create_table :email_templates do |t|
      t.string :body
      t.string :subject

      t.timestamps
    end
  end
end
