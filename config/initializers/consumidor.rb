Rails.application.config.after_initialize do
  Thread.new do
    begin
      ConsumidorJogosService.start
    rescue StandardError => e
      Rails.logger.error "Erro ao iniciar Consumidor: #{e.message}"
    end
  end
end
