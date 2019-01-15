class ChangeColumnToRequests < ActiveRecord::Migration[5.2]
  def change
    remove_column :requests, :confirmation_token, :string
    add_column :requests, :confirm_token, :string
  end
end
