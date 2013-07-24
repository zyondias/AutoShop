class AnunciosController < ApplicationController

	#chamando metodo para setar anuncios antes de alguns metodos que precisa do aunicio pelo find
	before_filter :set_anuncio, only: [:edit, :update, :delete, :destroy]
	def create
		anuncio = Anuncio.new params[:anuncio]
		if anuncio.save
			#metodo que deixa gravado a variavel por 2 requisicoes inves de duas .ideial para mandar respotar pra pagina
			flash[:notice] = "acnuncio cadastro com sucesso"
		end
		#enviando a pagina para pagina index(pagina princial)
		redirect_to root_path	
	end
	def edit
	end
	def update
		if @anuncio.update_attributes params[:anuncio]
			flash[:notice] = "O anunncio foi atualizado"
		end
		redirect_to root_path
	end

	def delete

	end

	def destroy
		if @anuncio.delete
			flash[:notice] = "excluido com sucesso"
		end
		redirect_to root_path
	end

	private
	#insolando metodo para setar anuncio
	def set_anuncio
		#funciona para rails 3 no quatro já muda pois precisa dar permisao
		@anuncio = Anuncio.find params[:id]
	end
end
