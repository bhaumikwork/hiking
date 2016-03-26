module ApplicationHelper
	def date_difference(start_date, end_date)
		(end_date.to_date - start_date.to_date).to_i + 1
	end

	def get_date_between(start_date, end_date)
		date_ary = []
		date_difference(start_date, end_date).times do |index|
			date_ary << start_date.to_date + index.day
		end
		return date_ary
	end
end
