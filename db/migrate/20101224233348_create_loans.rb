class CreateLoans < ActiveRecord::Migration
  def self.up
    create_table :loans do |t|
      t.string :account_number
      t.string :loan_detail_id
      t.timestamps
    end
  end

  def self.down
    drop_table :loans
  end
end
