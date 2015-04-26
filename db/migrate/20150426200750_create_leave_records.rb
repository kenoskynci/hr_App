class CreateLeaveRecords < ActiveRecord::Migration
  def change
    create_table :leave_records do |t|
      t.date :start_date
      t.date :end_date
      t.integer :number_Of_days
      t.string :leave_type
      t.references :employee, index: true

      t.timestamps null: false
    end
    add_foreign_key :leave_records, :employees
  end
end
