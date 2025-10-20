require 'bunny'

class ConsumidorJogosService
  def self.start
    connection = Bunny.new(hostname: 'localhost')
    connection.start

    channel = connection.create_channel
    queue = channel.queue('jogos_queue', durable: true)

    queue.subscribe(block: true) do |_delivery_info, _properties, body|
      puts "Recebido no consumidor: #{body}"
      data = JSON.parse(body)
      Relatorio.create(
        titulo: data['titulo'],
        preco: data['preco'],
        estoque: data['estoque']
      )
    end
  end
end

