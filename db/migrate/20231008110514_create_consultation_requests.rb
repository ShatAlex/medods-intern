class CreateConsultationRequests < ActiveRecord::Migration[7.1]
  def change
    create_table :consultation_requests do |t|
      t.string :request_text
      t.date :request_date
      t.references :patient, null: false, foreign_key: true, index: true

      t.timestamps
    end
  end
end
