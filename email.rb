require 'sendgrid-ruby'

from = SendGrid::Email.new(email: 'kerryjae@live.com')
subject = 'Hello World from the SendGrid Ruby Library!'
to = SendGrid::Email.new(email: 'Kerryjae@live.com')
content = SendGrid::Content.new(type: 'text/plain', value: params[:content])
mail = SendGrid::Mail.new(from, subject, to, content)

sg = SendGrid::API.new(api_key: ENV['SENDGRID_API_KEY'])
response = sg.client.mail._('send').post(request_body: mail.to_json)
puts response.status_code
puts response.body
puts response.headers
