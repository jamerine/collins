class CreateAccounts < ActiveRecord::Migration[5.0]
  def change
    create_table :accounts do |t|
      t.string :business_name, null: false
      t.integer :industry_type, default: 0
      t.integer :total_employees, default: 0
      t.timestamps
    end
  end
end
