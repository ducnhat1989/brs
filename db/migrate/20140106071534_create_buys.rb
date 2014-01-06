class CreateBuys < ActiveRecord::Migration
  def change
    create_table :buys do |t|
    	t.integer :book_id
    	t.integer :user_id
    	t.integer :buy_status
    	t.datetime :approve_buy_date
      t.timestamps
    end
  end
end
