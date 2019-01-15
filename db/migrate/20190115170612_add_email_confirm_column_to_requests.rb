class AddEmailConfirmColumnToRequests < ActiveRecord::Migration[5.2]
  def change
    add_column :requests, :email_confirmed, :boolean, :default => false
  end
end
