class CreateReplies < ActiveRecord::Migration[6.0]
  def change
    create_table :replies do |t|
      t.references :user, null: false
      t.references :post, null: false
      t.references :comment, null: false
      t.text :content, null: false
      t.string :account_name, null: false
      t.timestamps
    end
  end
end
