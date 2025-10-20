module Api
  class RelatoriosController < ApplicationController
    def index
      relatorios = Relatorio.all.order(created_at: :desc)
      render json: relatorios
    end

    def create
      jogos = ::GamesService.listar_jogos
      relatorios = jogos.map do |jogo|
        Relatorio.create(
          titulo: jogo['titulo'],
          preco: jogo['preco'],
          estoque: jogo['estoque']
        )
      end
      render json: relatorios, status: :created
    end
  end
end

