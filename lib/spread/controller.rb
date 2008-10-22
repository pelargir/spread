module Spread
  module Controller
    
    def self.included(base)
      base.extend(ClassMethods)
    end
    
    module ClassMethods
      def spread(action)
        define_method action do
          if request.post?
            if params[:email].blank?
              flash[:error] = "Email cannot be blank"
            else
              Spread::Mailer.deliver_spread(params[:email], params[:url])
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