class UserMailer < ApplicationMailer
	default from: 'donalmooney87@gmail.com'

	def order_email(user)
		@user = user
		@url = 'donalmooney87@gmail.com'
		mail(to: @user.email, subject: 'Thank you for placing an order')
	end

	def welcome_email(user)
		@user = user
		@url = 'donalmooney87@gmail.com'
		mail(to: @user.email, subject: 'Thank you for creating an account')
	end
end
