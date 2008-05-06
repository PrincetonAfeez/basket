class CreateInventories < ActiveRecord::Migration
  def self.up
    create_table :inventories do |t|
      t.decimal :price, :precision => 10, :scale => 2
      t.datetime :effective_at
      t.datetime :expires_at
      t.boolean :is_effective
      t.references :billable, :polymorphic => true
      t.timestamps
    end
  end

  def self.down
    drop_table :inventories
  end
end
