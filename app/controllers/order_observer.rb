require 'my_logger'

class OrderObserver < ActiveRecord::Observer
	def after_order(record)

		@logger = MyLogger.instance

		#use my logger to record a message about he order

		@logger.logInformation("blah blah")
		@logger.logInformation("####################")
	end
end