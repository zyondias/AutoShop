class IdiomasController < ApplicationController
	def update
		lingua_escolhida = params[:lingua] || request.env['HTTP_ACCEPT_LANGUAGE'].
		scan(/^[a-z]{2}/).first
		I18n.locale = lingua_escolhida
		redirect_to root_path
	end
	
	
end