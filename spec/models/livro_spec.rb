require 'spec_helper'

describe Livro do
  it 'deve ter o atributo "traducao" false por default' do
    livro = Livro.new
    livro.save validate: false
    livro.traducao.should == false
  end

  it { should have_valid(:numero_edicao).when '4', '', nil }
  it { should_not have_valid(:numero_edicao).when '4 ed', '-1' }

  it { should have_valid(:numero_paginas).when '180', '', nil }
  it { should_not have_valid(:numero_paginas).when 'cento e oitenta', '-1' }
end
