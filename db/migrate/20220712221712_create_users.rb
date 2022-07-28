class CreateUsers < ActiveRecord::Migration[7.0]
  # has_many :posts, :likes, :comments, :foreign_key => "author_id"
  def change
    create_table :users do |t|
      # primary_key = "author_id"
      t.string :name
      t.string :photo
      t.text :bio
      t.integer :post_counter, default: 0, null: false
      t.string :timestamps

      t.timestamps
    end
  end
end
