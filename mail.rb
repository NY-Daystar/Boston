require 'mail'
require 'yaml'

# TODO load la config dans une classe
config = YAML.load_file('config.yaml')
email = config['email']
password = config['password']

Mail.defaults do
  delivery_method :smtp, {
    address: 'smtp.gmail.com',
    port: 587,
    domain: 'gmail.com',
    user_name: email,
    password: password,
    authentication: 'plain',
    enable_starttls_auto: true
  }
end

def send_email(to, subject, body)
  mail = Mail.new do
    from 'xgravityx3@gmail.com'
    to to
    subject subject
    body body
  end

  mail.deliver!
end

# Envoi d'un mail
send_email('luc4snoga@gmail.com', 'Mon sujet d\'e-mail', 'Corps de mon e-mail')
