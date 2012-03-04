class Ability
  include CanCan::Ability

  def initialize(usuario)
    if usuario.gestor? || usuario.contribuidor?
      [ArtigoDePeriodico, ArtigoDeEvento, Livro, ObjetoDeAprendizagem,
       TrabalhoDeObtencaoDeGrau, PeriodicoTecnicoCientifico,
       Relatorio].each {|tipo| can [:create, :read], tipo }
    end

    if usuario.admin?
      can [:atualizar_papeis, :index], Usuario
    end
  end
end
