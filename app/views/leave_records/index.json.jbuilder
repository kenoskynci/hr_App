json.array!(@leave_records) do |leave_record|
  json.extract! leave_record, :id, :start_date, :end_date, :number_Of_days, :leave_type, :employee_id
  json.url leave_record_url(leave_record, format: :json)
end
