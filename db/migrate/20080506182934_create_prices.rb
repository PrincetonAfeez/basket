class CreatePrices < ActiveRecord::Migration
  def self.up
    create_table :prices do |t|
      t.decimal :price, :precision => 10, :scale => 2
      t.string :currency, :limit => 3
      t.decimal :discount, :precision => 4, :scale => 2
      t.integer :discount_at
      #currently unused
      t.timestamps
    end
  end

  def self.down
    drop_table :prices
  end
end
