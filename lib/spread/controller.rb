module Spread
  module Controller
    def self.included(base)
      base.extend(ClassMethods)
    end
    
    module ClassMethods
      def spread(action)
        mailer = construct_mailer
        construct_action(action, mailer)
      end
      
      def construct_mailer
        mailer = Class.new(ActionMailer::Base) do
          def spread(email, url)
            recipients email
            body :url => url
          end
        end
        mailer.template_root = "#{RAILS_ROOT}/vendor/plugins/spread/lib/"
        mailer
      end
      
      def construct_action(action, mailer)
        define_method action do
          if request.post?
            if params[:email].blank?
              flash[:error] = "Email cannot be blank"
            else
              mailer.deliver_spread(params[:email], params[:url])
              flash[:notice] = "An email has been sent to #{params[:email]}"
              redirect_to params[:url] || "/"
            end
          end
        end
      end
    end
  end
end

ActionController::Base.send :include, Spread::Controller