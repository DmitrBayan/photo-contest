class AddAasmStatesToPost < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :aasm_state, :string
  end
end
