class AnunciosController < ApplicationController

	#verificando se o usuario esta autenticado
	before_filter :authenticate_user!
	#chamando metodo para setar anuncios antes de alguns metodos que precisa do aunicio pelo find
	before_filter :set_anuncio, only: [:edit, :update, :delete, :destroy, :approve]

	#before_filter :restrito_por_anunciante, except: :create
	def create
		anuncio = Anuncio.new params_anuncio
		anuncio.anunciante = current_user
		if anuncio.save
			#metodo que deixa gravado a variavel por 2 requisicoes inves de duas .ideial para mandar respotar pra pagina
			flash[:notice] = "acnuncio cadastro com sucesso"
			redirect_to root_path
		else
			@marcas = Marca.por_nome
			render "anuncios/cadastro", locals: {anuncio: anuncio}
		end
		#enviando a pagina para pagina index(pagina princial)
			
	end
	def edit
		@marcas = Marca.por_nome
	end
	def update
		if @anuncio.update_attributes params_anuncio 
			flash[:notice] = "O anunncio foi atualizado"
		end
		redirect_to root_path
	end

	def delete

	end

	def destroy
		 @anuncio.delete
		flash[:notice] = "excluido com sucesso"
		respond_to do |format|
       		format.js {head :ok}
		    format.html { redirect_to root_path }
		end
	end

	def approve	
		#authorize! :approve , @anuncio
		if @anuncio.update_attribute :aprovado, true
			flash[:notice] = "Anuncio aprovado"
		end
		redirect_to root_path
	end

	private
	#insolando metodo para setar anuncio
	def set_anuncio
		#funciona para rails 3 no quatro já muda pois precisa dar permisao
		@anuncio = Anuncio.find params[:id]
		@anuncio.anunciante = current_user
	end

	#metodo para verificar se o quem é o anunciante
	def restrito_por_anunciante
		anunciante = Anuncio.find(params[:id]).anunciante
		is_admin = current_user.role == "admin"
		unless is_admin || anunciante == current_user
			flash[:alert] = "Voce nao tem permisao"
			redirect_to root_path		
		end		
	end

	def params_anuncio
		parameters = params[:anuncio]
		if parameters[:marca_attributes] && !parameters[:marca_attributes][:nome].empty?
			parameters.delete :marca_id
		else
			parameters.delete :marca_attributes
		end
		parameters
		
	end
end
