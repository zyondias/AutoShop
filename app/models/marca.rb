class Marca < ActiveRecord::Base
  attr_accessible :nome

  def self.por_nome
  	order :nome  	
  end
end
