class CreateInterviews < ActiveRecord::Migration[6.0]
  def change
    create_table :interviews do |t|
      t.date :start_date
      t.time :start_time
      t.string :end_date_date
      t.time :end_time
      t.references :candidate, null: false, foreign_key: true

      t.timestamps
    end
  end
end
