require 'bunny'

begin
  $rabbitmq_connection = Bunny.new.start
  $rabbitmq_channel = $rabbitmq_connection.create_channel
  $queue = $rabbitmq_channel.queue('jogos_queue', durable: true)

  Rails.logger.info "✅ Conectado ao RabbitMQ!"
rescue StandardError => e
  Rails.logger.error "❌ Erro ao conectar ao RabbitMQ: #{e.message}"
end
