# frozen_string_literal: true

class CreateSerpros < ActiveRecord::Migration[7.0]
  def change
    create_table :serpros do |t|
      t.string :token
      t.string :document
      t.integer :status, default: 0

      t.timestamps
    end

    add_index :serpros, :token, name: 'index_serpros_on_token', unique: true
  end
end
