class RemoveContentFromReply < ActiveRecord::Migration[6.0]
  def change
    remove_column :replies, :content, :text
  end
end
