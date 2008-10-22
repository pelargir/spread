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
          def email(email, url)
            recipients email
            body :url => url
          end
        end
        mailer.template_root = "#{RAILS_ROOT}/vendor/plugins/spread/templates/"
        mailer
      end
      
      def construct_action(action, mailer)
        define_method action do
          if request.post?
            if params[:email].blank?
              flash[:error] = "Email cannot be blank"
            else
              mailer.deliver_email(params[:email], params[:url])
              flash[:notice] = "An email has been sent to #{params[:email]}"
              redirect_to params[:url] || "/" and return
            end
          end
          render :file => "#{RAILS_ROOT}/vendor/plugins/spread/templates/form.html.erb"
        end
      end
      
    end
  end
end

ActionController::Base.send :include, Spread::Controller