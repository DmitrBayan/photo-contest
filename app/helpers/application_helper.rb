module ApplicationHelper
	def full_title(title='')
		full_title='PhotoContest'
		full_title=title+' *'+full_title+'*' unless title.nil?
	end
	
	def current_user
    	@current_user ||= User.find_by(id: session[:user_id])
  	end
end
