class CreateRankings < ActiveRecord::Migration[6.0]
  def change
    create_table :rankings do |t|
      t.string :title,null: false
      t.string :rank1,null: false
      t.string :rank2,null: false
      t.string :rank3,null: false
      t.string :image,null: false
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
