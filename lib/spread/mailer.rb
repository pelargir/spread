module Spread
  class Mailer < ActionMailer::Base
    def spread(email, url)
      recipients email
      body :url => url
    end
  end
end

Spread::Mailer.template_root = "#{RAILS_ROOT}/vendor/plugins/spread/lib/"