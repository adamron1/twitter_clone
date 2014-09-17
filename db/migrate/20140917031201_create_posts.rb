class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.text :content
      t.references :user_id, index: true

      t.timestamps
    end
  end
end
