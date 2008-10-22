module Spread
  module Controller
    
    def self.included(base)
      base.extend(ClassMethods)
    end
    
    module ClassMethods
      def spread(action)
        define_method action do
          if request.post? && Spread::Mailer.deliver_spread(params[:email])
            flash[:notice] = "An email has been sent to #{params[:email]}"
            redirect_to "/" #specify redirect
          end
        end
      end
    end
    
  end
end

ActionController::Base.send :include, Spread::Controller