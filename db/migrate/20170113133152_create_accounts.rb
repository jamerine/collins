class CreateAccounts < ActiveRecord::Migration[5.0]
  def change
    create_table :accounts do |t|
      t.string :business_name, null: false

      t.timestamps
    end
  end
end
