class CreateRecommendations < ActiveRecord::Migration[7.1]
  def change
    create_table :recommendations do |t|
      t.string :recommend_text
      t.references :consultation_request, null: false, foreign_key: true

      t.timestamps
    end
  end
end
