# frozen_string_literal: true

class CreateNewsLetter < ActiveRecord::Migration[6.1]
  def change
    create_table :newsletters do |t|
      t.string :ip_address
      t.string :email_address

      t.timestamps
    end
  end
end
