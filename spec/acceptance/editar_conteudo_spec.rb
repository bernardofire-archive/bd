# encoding: utf-8

require 'spec_helper'

feature 'Editar Conteúdo' do
  context 'conteúdo em estado pendente ou recolhido' do
    scenario 'editar conteúdo' do
      Papel.criar_todos
      autenticar_usuario(Papel.contribuidor)

      tipos_de_conteudo.each do |tipo|
        conteudo = create tipo
        conteudo.submeter
        visit edit_conteudo_path(conteudo)
        page.should have_content 'Conteúdo não pode ser editado'
        current_path.should == conteudo_path(conteudo)
      end
    end
  end
end
