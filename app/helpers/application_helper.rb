module ApplicationHelper
	def date_difference(start_date, end_date)
		(end_date.to_date - start_date.to_date).to_i + 1
	end
end
