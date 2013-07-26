class ApplicationController < ActionController::Base
  protect_from_forgery

    #exebindo msg  para usuario sem autorizacao
    rescue_from CanCan::AccessDenied, with: :sem_autorizacao
  	#metedo para quem nao tem autorizacao 

  	private
	def sem_autorizacao
		redirect_to root_url, alert: "Voce nao tem autorizacao para acessar o recurso"
	end
end
