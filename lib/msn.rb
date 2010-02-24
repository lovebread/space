require 'socket'
require 'rubygems'
require 'curb'
require 'cgi'

class Msn

	SERVER = 'messenger.hotmail.com'
  PORT = 1863

  NEXUS  = 'https://nexus.passport.com/rdr/pprdr.asp'
  SSH_LOGIN  = 'login.live.com/login2.srf'

	CURL = '/usr/bin/curl'

	def initialize
		@trID = 1
	end

	def connect
		@sock = TCPSocket::new(SERVER, PORT)
		output "VER #{@trID} MSNP9 CVR0\r\n"
		str = input
		output "CVR #{@trID} 0x0409 win 4.10 i386 MSNMSGR 7.0.0816 MSMSGS gaoxh04@mails.tsinghua.edu.cn\r\n"
		str = input 
		output "USR #{@trID} TWN I gaoxh04@mails.tsinghua.edu.cn\r\n"
		str = input
		notification_server = str.split(" ")[3]
    puts notification_server
		ip = notification_server.split(":").first
		port = notification_server.split(":").last
		@sock.close
		@sock = TCPSocket::new(ip, port)
		@trID = 1
		output "VER #{@trID} MSNP9 CVR0\r\n"
    input
    output "CVR #{@trID} 0x0409 win 4.10 i386 MSNMSGR 7.0.0816 MSMSGS gaoxh04@mails.tsinghua.edu.cn\r\n" 
    input 
    output "USR #{@trID} TWN I gaoxh04@mails.tsinghua.edu.cn\r\n"
		auth_token = input.split(" ").last
		c = Curl::Easy.new(NEXUS)
		c.perform
		c.header_str.match(/DALogin=(.*?),/)
		c = Curl::Easy.new($1)
		c.headers = "Authorization: Passport1.4 OrgVerb=GET,OrgURL=http%3A%2F%2Fmessenger%2Emsn%2Ecom,sign-in=#{CGI::escape "gaoxh04@mails.tsinghua.edu.cn"},pwd=#{CGI::escape "20041065"},#{auth_token}"
		c.perform
		puts c.header_str
		c.header_str.match(/from-PP='(.*?)'/)
	end

	def rx_data
	end

	def grab
	end

protected

	def output data
		@sock.write data
		@trID = @trID + 1
		puts ">>> #{data}"
	end

	def input
		str = @sock.recv(1000)
		puts "<<< #{str}"
		str
	end

	def ssh_auth
	end		

	def error_code
		case @code
			when 201:
        return 'Error: 201 Invalid parameter';
      when 217:
        return 'Error: 217 Principal not on-line';
      when 500:
        return 'Error: 500 Internal server error';
      when 540:
        return 'Error: 540 Challenge response failed';
      when 601:
        return 'Error: 601 Server is unavailable';
      when 710:
        return 'Error: 710 Bad CVR parameters sent';
      when 713:
        return 'Error: 713 Calling too rapidly';
      when 731:
        return 'Error: 731 Not expected';
      when 800:
        return 'Error: 800 Changing too rapidly';
      when 910:
      when 921:
        return 'Error: 910/921 Server too busy';
      when 911:
        return 'Error: 911 Authentication failed';
		end
	end

end

msn = Msn.new
msn.connect
