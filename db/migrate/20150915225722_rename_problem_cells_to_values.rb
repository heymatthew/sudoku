class RenameProblemCellsToValues < ActiveRecord::Migration
  def change
    rename_column :problems, :cells, :values
  end
end
