require 'net/http'
require 'json'

class GamesService
  API_GAMES_URL = 'http://localhost:3000/api/jogos'

  def self.listar_jogos
    uri = URI(API_GAMES_URL)
    response = Net::HTTP.get(uri)
    JSON.parse(response)
  rescue StandardError => e
    Rails.logger.error "Erro ao acessar API Games: #{e.message}"
    []
  end
end
