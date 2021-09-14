class CreateClients < ActiveRecord::Migration[6.1]
  def change
    create_table :clients do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :address
      t.belongs_to :bank_agency, null: false, foreign_key: true

      t.timestamps
    end
  end
end
