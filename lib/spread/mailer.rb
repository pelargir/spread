module Spread
  class Mailer < ActionMailer::Base
    def spread(email)
      recipients email
      body :url => "http://foo.com"
    end
  end
end

Spread::Mailer.template_root = "#{RAILS_ROOT}/vendor/plugins/spread/lib/"