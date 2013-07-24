module ApplicationHelper
	def valor_formatado(number)
		number_to_currency number,
			unit: "R$: ",
			separador: ",",	
			delimiter: "."
	end
end
