# encoding: utf-8

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

def carregar_idiomas
  File.read(File.join("#{Rails.root}", 'db', 'seeds', 'idiomas.txt')).each_line do |idioma|
    sigla, descricao = idioma.split(";").map(&:strip)
    Idioma.create! sigla: sigla, descricao: descricao
  end
end

carregar_idiomas if Idioma.count == 0

##############  Seeds para opções "grau" em trabalho de obtencação de grau ############

Grau.delete_all
# Criando as opções
Grau.create([
    { :nome => 'Graduação' },
    { :nome => 'Especialização' },
    { :nome => 'Mestrado' },
    { :nome => 'Doutorado' }
])

#######################  Seeds para Eixos temáticos e cursos #######################

EixoTematico.delete_all
Curso.delete_all

# Criando eixo Ambiente e Saúde e seus cursos
ambiente_saude = EixoTematico.create(nome: 'Ambiente e Saúde')
ambiente_saude.cursos.create([
  { nome: 'Gestão Ambiental'    },
  { nome: 'Gestão Hospitalar'   },
  { nome: 'Oftálmica'           },
  { nome: 'Radiologia'          },
  { nome: 'Saneamento Ambiental'},
  { nome: 'Sistemas Biomédicos' },
])

# Criando eixo Apoio Escolar e seus cursos
apoio_escolar = EixoTematico.create(nome: 'Apoio Escolar')
apoio_escolar.cursos.create([
  { nome: 'Processos Escolares'},
])

# Criando eixo Controle e Processos Industriais e seus cursos
controle_processos_industriais = EixoTematico.create(nome: 'Controle e Processos Industriais')
controle_processos_industriais.cursos.create([
  { nome: 'Automação Industrial'         },
  { nome: 'Eletrônica Industrial'        },
  { nome: 'Eletrotécnica Industrial'     },
  { nome: 'Gestão da Produção Industrial'},
  { nome: 'Manutenção de Aeronaves'      },
  { nome: 'Manutenção Industrial'        },
  { nome: 'Mecânica de Precisão'         },
  { nome: 'Mecatrônica Industrial'       },
  { nome: 'Processos Ambientais'         },
  { nome: 'Processos Metalúrgicos'       },
  { nome: 'Processos Químicos'           },
  { nome: 'Sistemas Elétricos'           }
])

# Criando eixo Gestão e Negócios e seus cursos
gestao_negocios = EixoTematico.create(nome: 'Gestão e Negócios')
gestao_negocios.cursos.create([
  { nome: 'Comércio Exterior'         },
  { nome: 'Gestão Comercial'          },
  { nome: 'Gestão da Qualidade'       },
  { nome: 'Gestão de Cooperativas'    },
  { nome: 'Gestão de Recursos Humanos'},
  { nome: 'Gestão Financeira'         },
  { nome: 'Gestão Pública'            },
  { nome: 'Logística'                 },
  { nome: 'Marketing'                 },
  { nome: 'Negócios Imobiliários'     },
  { nome: 'Processos Gerenciais'      },
  { nome: 'Secretariado'              }
])

# Criando eixo Hospitalidade e Lazer e seus cursos
hospitalidade_lazer = EixoTematico.create(nome: 'Hospitalidade e Lazer')
hospitalidade_lazer.cursos.create([
  { nome: 'Eventos'                     },
  { nome: 'Gastronomia'                 },
  { nome: 'Gestão Desportiva e de Lazer'},
  { nome: 'Gestão de Turismo'           },
  { nome: 'Hotelaria'                   }
])

# Criando eixo Informação e Comunicação e seus cursos
informacao_comunicacao = EixoTematico.create(nome: 'Informação e Comunicação')
informacao_comunicacao.cursos.create([
  { nome: 'Análise e Desenvolvimento de Sistemas'},
  { nome: 'Banco de Dados'                       },
  { nome: 'Geoprocessamento'                     },
  { nome: 'Gestão da Tecnologia da Informação'   },
  { nome: 'Gestão de Telecomunicações'           },
  { nome: 'Jogos Digitais'                       },
  { nome: 'Redes de Computadores'                },
  { nome: 'Redes de Telecomunicações'            },
  { nome: 'Segurança da Informação'              },
  { nome: 'Sistemas de Telecomunicações'         },
  { nome: 'Sistemas para Internet'               },
  { nome: 'Telemática'                           }
])

#######################  Seeds para Áreas e sub-áreas #######################

Area.delete_all
SubArea.delete_all
#Criando Ciências Exatas e da Terra
exatas = Area.create(nome: 'Ciências Exatas e da Terra')
#Criando sub_areas para exatas
exatas.sub_areas.create([
        { nome: 'Astronomia'                    },
        { nome: 'Ciência da Computação'         },
        { nome: 'Física'                        },
        { nome: 'Geociências'                   },
        { nome: 'Matemática'                    },
        { nome: 'Oceanografia'                  },
        { nome: 'Probabilidade e Estatística'   },
        { nome: 'Química'                       }
])

#Criando areas biologicas
biologicas = Area.create(nome: 'Ciências Biológicas')
#Criando sub_areas para biologicas
biologicas.sub_areas.create([
        { nome: 'Biofísica'        },
        { nome: 'Biologia Geral'   },
        { nome: 'Bioquimíca'       },
        { nome: 'Botânica'         },
        { nome: 'Ecologia'         },
        { nome: 'Farmacologia'     },
        { nome: 'Fisiologia'       },
        { nome: 'Genética'         },
        { nome: 'Imunologia'       },
        { nome: 'Microbiologia'    },
        { nome: 'Morfologia'       },
        { nome: 'Parasitologia'    },
        { nome: 'Zoologia'         }
])

#Criando areas Engenharias
engenharias = Area.create(nome: 'Engenharias')
#Criando sub_ares para Engenharias
engenharias.sub_areas.create([
        { nome: 'Engenharia Aeroespacial'                 },
        { nome: 'Engenharia Biomédica'                    },
        { nome: 'Engenharia Civil'                        },
        { nome: 'Engenharia de Materiais e Metalúrgica'   },
        { nome: 'Engenharia de Minas'                     },
        { nome: 'Engenharia de Produção'                  },
        { nome: 'Engenharia de Transportes'               },
        { nome: 'Engenharia Elétrica'                     },
        { nome: 'Engenharia Mecânica'                     },
        { nome: 'Engenharia Naval e Oceânica'             },
        { nome: 'Engenharia Nuclear'                      },
        { nome: 'Engenharia Química'                      },
        { nome: 'Engenharia Sanitária'                    }
])

#Criando areas saúde
saude = Area.create(nome: 'Ciências da Saúde')
#Criando sub_areas para saúde
saude.sub_areas.create([
        { nome: 'Educação Física'                      },
        { nome: 'Enfermagem'                           },
        { nome: 'Farmácia'                             },
        { nome: 'Fisioterapia e Terapia Ocupacional'   },
        { nome: 'Fonoaudiologia'                       },
        { nome: 'Medicina'                             },
        { nome: 'Nutrição'                             },
        { nome: 'Odontologia'                          },
        { nome: 'Saude Coletiva'                       }
])

#Criando areas Ciências Agrárias
agrarias = Area.create(nome: 'Ciências Agrárias')
#Criando sub_areas para Ciências Agrárias
agrarias.sub_areas.create([
        { nome: 'Agronomia'                                    },
        { nome: 'Ciência e Tecnologia de Alimentos'            },
        { nome: 'Engenharia Agrícola'                          },
        { nome: 'Medicina Veterinária'                         },
        { nome: 'Recursos Florestais e Engenharia Florestal'   },
        { nome: 'Recursos Pesqueiros e Engenharia de Pesca'    },
        { nome: 'Zootecnia'                                    }
])

#Criando areas Ciências Sociais Aplicadas
sociais_aplicadas = Area.create(nome: 'Ciências Sociais Aplicadas')
#Criando sub_areas para Ciências Sociais Aplicadas
sociais_aplicadas.sub_areas.create([
        { nome: 'Administração'                    },
        { nome: 'Arquitetura e Urbanismo'          },
        { nome: 'Ciência da Informação'            },
        { nome: 'Comunicação'                      },
        { nome: 'Demografia'                       },
        { nome: 'Desenho Industrial'               },
        { nome: 'Direito'                          },
        { nome: 'Economia'                         },
        { nome: 'Economia Doméstica'               },
        { nome: 'Museologia'                       },
        { nome: 'Planejamento Urbano e Regional'   },
        { nome: 'Serviço Social'                   },
        { nome: 'Turismo'                          }
])

#Criando areas Ciências Humanas
humanas = Area.create(nome: 'Ciências Humanas')
#Criando sub_areas para Ciências Humanas
humanas.sub_areas.create([
        { nome: 'Antropologia'       },
        { nome: 'Arqueologia'        },
        { nome: 'Ciência Política'   },
        { nome: 'Educação'           },
        { nome: 'Filosofia'          },
        { nome: 'Geografia'          },
        { nome: 'História'           },
        { nome: 'Psicologia'         },
        { nome: 'Sociologia'         },
        { nome: 'Teologia'           }
])

#Criando areas Linguística, Letras e Artes
linguisticas_letras_e_artes = Area.create(nome: 'Linguística, Letras e Artes')
#Criando sub_areas para Linguística, Letras e Artes 
linguisticas_letras_e_artes.sub_areas.create([
        { nome: 'Artes'        },
        { nome: 'Letras'       },
        { nome: 'Liguística'   }
])

#Criando areas Outras
outras = Area.create(nome: 'Outras')
#Criando sub_areas para Outras
outras.sub_areas.create([
        { nome: 'Administração Hospitalar'    },
        { nome: 'Administracao Rural'         },
        { nome: 'Biomedicina'                 },
        { nome: 'Carreira Militar'            },
        { nome: 'Carreira Religiosa'          },
        { nome: 'Ciências'                    },
        { nome: 'Ciências Atuarias'           },
        { nome: 'Ciências Sociais'            },
        { nome: 'Decoração'                   },
        { nome: 'Desenho de Moda'             },
        { nome: 'Desenho de Projetos'         },
        { nome: 'Diplomacia'                  },
        { nome: 'Engenharia Cartográfica'     },
        { nome: 'Engenharia de Agrimensura'   },
        { nome: 'Engenharia de Armamentos'    },
        { nome: 'Engenharia Mecatrônica'      },
        { nome: 'Engenharia Têxtil'           },
        { nome: 'Estudos Sociais'             },
        { nome: 'História Natural'            },
        { nome: 'Multidisciplinar'            },
        { nome: 'Química Industrial'          },
        { nome: 'Relações Internacionais'     },
        { nome: 'Relações Públicas'           },
        { nome: 'Secretariado Executivo'      },
        { nome: 'Outra'                       }
])
