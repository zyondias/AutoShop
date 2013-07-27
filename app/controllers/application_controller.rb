class ApplicationController < ActionController::Base
  protect_from_forgery

    #exebindo msg  para usuario sem autorizacao
    rescue_from CanCan::AccessDenied, with: :sem_autorizacao
    #verificando a localizacao
    before_filter :verificar_locale

  	#metedo para quem nao tem autorizacao 
  	def render_cadastro(anuncio, template="anuncios/cadastro")
  		render template, locals: {
  			anuncio: anuncio,
  			marcas: Marca.por_nome
  		}
  	end

    def default_url_options
      {:locale => I18n.locale}    
    end
  	private
    #metodo para verificar a localizacao
  def verificar_locale
    
  end
	def sem_autorizacao
		redirect_to root_url, alert: "Voce nao tem autorizacao para acessar o recurso"
	end


end
