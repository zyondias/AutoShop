#encoding: utf-8

require "capybara/rails"
require "capybara/rspec"

describe "cadastro de anuncios " do 
	
	context "Preenchendo formulario corretamente" do 
		it "Deveria criar e exibir o novo anuncios",  js: true do 
			autentica
			visit "/"

			fill_in "Modelo", with: "Fusca"
			fill_in "Marca", with: "Volks"
			fill_in "Descricao", with: "Carrinho maroto"
			fill_in "Ano", with: "1972"
			fill_in "Valor", with: "6500"

			click_button "Create Anuncio"

			expect(page).to have_content "Fusca"
			expect(page).to have_content "Volks"
			expect(page).to have_content "Carrinho maroto"
			expect(page).to have_content "1972"
			expect(page).to have_content "R$: 6.500.00"
		end
	end

end