class AddConfirmationToRequests < ActiveRecord::Migration[5.2]
  def change
    add_column :requests, :confirmation_token, :string
  end
end
