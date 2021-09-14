class CreateBankAgencies < ActiveRecord::Migration[6.1]
  def change
    create_table :bank_agencies do |t|
      t.string :name
      t.string :address
      t.belongs_to :bank, null: false, foreign_key: true

      t.timestamps
    end
  end
end
