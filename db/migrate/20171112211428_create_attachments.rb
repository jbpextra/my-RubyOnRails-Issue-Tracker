class CreateAttachments < ActiveRecord::Migration[5.1]
  def change
    create_table :attachments do |t|
      t.string :content
      t.references :issue, foreign_key: true
      t.references :user , foreign_key: true

      t.timestamps
    end
    add_index :attachments, [:issue_id, :created_at]
  end
end
