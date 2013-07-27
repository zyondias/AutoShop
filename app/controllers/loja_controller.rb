class LojaController < ApplicationController
   def principal
  	@marcas = Marca.por_nome
  	@anuncio = Anuncio.new {|a| a.build_marca}
  	is_admin = current_user && current_user.role == "admin"
 	@anuncios = if is_admin
 		Anuncio.all
 	else
 		Anuncio.aprovados
 	end
 	anuncio = Anuncio.new {|a| a.build_marca}
 	render_cadastro  anuncio, "principal"
  end

 end
