class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.string :morning, null: false # タイトルカラム
      t.string :noon, null: false # タイトルカラム
      t.string :night, null: false # タイトルカラム
      t.string :late_night, null: false # タイトルカラム
      t.string :comment, null: false # 本文カラム
      t.references :user, foreign_key: true, null: false # 外部キー (User)
      t.timestamps
    end
  end
end