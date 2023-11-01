class AddIndexesToForeignKeys < ActiveRecord::Migration[7.1]
  def change
    add_index :posts, :author_id
    add_index :comments, :user_id
    add_index :comments, :post_id
    add_index :likes, :user_id
    add_index :likes, :post_id
  end
end
