class Employee < ActiveRecord::Base
    has_many :leave_record
end
