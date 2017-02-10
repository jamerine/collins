class CreateLeads < ActiveRecord::Migration[5.0]
  def change
    create_table :leads do |t|
      t.integer :entity_number
      t.string  :business_name
      t.string  :business_type
      t.date    :original_filing_date
      t.date    :expiry_date
      t.string  :status
      t.string  :business_location
      t.string  :county
      t.string  :state

      t.timestamps
    end
  end
end
