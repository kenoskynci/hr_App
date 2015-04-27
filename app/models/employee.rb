class Employee < ActiveRecord::Base
    has_many :leave_records
end
