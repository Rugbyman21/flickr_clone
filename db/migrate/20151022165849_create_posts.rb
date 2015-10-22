class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
    t.column :caption, :string
  

      t.timestamps null: false
    end
  end
end
