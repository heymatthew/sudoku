class AddGridColumnToProblem < ActiveRecord::Migration
  def change
    add_column :problems, :grid, :string, :null => false, :default => ''
  end
end
