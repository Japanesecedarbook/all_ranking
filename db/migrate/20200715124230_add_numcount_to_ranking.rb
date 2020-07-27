class AddNumcountToRanking < ActiveRecord::Migration[6.0]
  def change
    add_column :rankings, :likes_count, :integer
  end
end
