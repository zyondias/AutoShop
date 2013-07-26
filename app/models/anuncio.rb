class Anuncio < ActiveRecord::Base
   #adcionando relacionamento com user (anunciante)
  belongs_to :anunciante, class_name: "User"
  belongs_to :marca
  validates_presence_of :modelo, :descricao  
  attr_accessible :ano, :descricao, :modelo, :valor, :marca_attributes, :marca_id

  accepts_nested_attributes_for :marca

  	def self.aprovados
		where aprovado: true
	end
end
