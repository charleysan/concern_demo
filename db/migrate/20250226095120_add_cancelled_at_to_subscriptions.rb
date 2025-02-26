class AddCancelledAtToSubscriptions < ActiveRecord::Migration[8.0]
  def change
    add_column :subscriptions, :cancelled_at, :datetime
  end
end
