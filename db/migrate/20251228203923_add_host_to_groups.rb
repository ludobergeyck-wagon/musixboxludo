class AddHostToGroups < ActiveRecord::Migration[7.1]
  def change
    add_reference :groups, :host, null: false, foreign_key: true
  end
end
