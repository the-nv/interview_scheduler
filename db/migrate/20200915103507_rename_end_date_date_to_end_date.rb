class RenameEndDateDateToEndDate < ActiveRecord::Migration[6.0]
  def change
    rename_column :interviews, :end_date_date, :end_date
  end
end
