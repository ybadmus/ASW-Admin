class CreateEnquiry < ActiveRecord::Migration[6.1]
  def change
    create_table :enquiries do |t|
      t.string :name
      t.text :message
      t.string :email
      t.string :phone
      t.string :subject

      t.timestamps
    end
  end
end
