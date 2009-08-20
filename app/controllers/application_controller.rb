# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details
  
  layout 'application'
  
  def check_authentication
    unless session[:user_id]
      session[:intended_controller] = controller_name
      session[:intended_action]     = action_name
      flash[:error] = 'Necesitas iniciar session para entrar a esta area.'
      redirect_to login_path
    end
  end

  def check_authorization
    user = User.find(session[:user_id])
    unless user.roles.detect  { |role| role.rights.detect  { 
                                                              |right| right.action == action_name && right.controller ==  self.class.controller_path } 
                                                            } || user.person.class.to_s == "Admin"
                                                            
      flash[:notice] = "No estas autorizado para ver la pagina que haz solicitado"
      request.env["HTTP_REFERER"] ? (redirect_to :back) : (redirect_to :login)
      return false
    end
  end
  
  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password
end
