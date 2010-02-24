# ContactGrabber
class ContactGrabber

	MAILBOX = ['gmail', 'yahoo', 'msn', 'hotmail', '163', 'sina', 'tom', 'yeah', '189'] 

	def initialize
	
	end

	def grab mailbox, user_name, password
		unless ContactGrabber::MAILBOX.include? mailbox
			puts "not supported mailbox type, please input: #{ContactGrabber::MAILBOX.join(',')}"
		else
			output = `java ContactGrabber #{mailbox} #{user_name} #{password}`
			contact_list = []
			# parse the result and return the result as an array where each element is stored as [nickname, mail address] pair
			return contact_list
		end	
	end

end
