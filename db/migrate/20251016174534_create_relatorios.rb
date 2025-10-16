class CreateRelatorios < ActiveRecord::Migration[8.0]
  def change
    create_table :relatorios do |t|
      t.string :titulo
      t.decimal :preco
      t.integer :estoque

      t.timestamps
    end
  end
end
