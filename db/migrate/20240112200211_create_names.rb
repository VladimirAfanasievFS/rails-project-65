# frozen_string_literal: true

class CreateNames < ActiveRecord::Migration[7.1]
  def change
    create_table :names do |t|
      t.string :email

      t.timestamps
    end
  end
end
