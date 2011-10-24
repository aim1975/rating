class CreateRecommendations < ActiveRecord::Migration
  def change
    create_table :recommendations do |t|
      t.integer :firm_id
      t.integer :rating

      t.timestamps
    end
  end
end
