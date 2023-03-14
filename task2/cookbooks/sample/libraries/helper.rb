require 'net/smtp'

module HandlerSendEmail
  class Helper
    def send_email_on_run_failure(node_name)
      message = "From: Chef <jagdeep.devops@gmail.com>\n"
      message << "To: Grant <bhatta.jagdeep@optum.com>\n"
      message << "Subject: Chef run failed\n"
      message << "Date: #{Time.now.rfc2822}\n\n"
      message << "Chef run failed on #{node_name}\n"
      Net::SMTP.start('localhost', 25) do |smtp|
        smtp.send_message message, 'jagdeep.devops@gmail.com', 'bhatta.jagdeep@optum.com'
      end
    end
  end
end