class AddHostToGroups < ActiveRecord::Migration[7.1]
  def change
    add_reference :groups, :host, null: true, foreign_key: { to_table: :users }
  end
end