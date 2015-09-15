class RenameProblemGridToCells < ActiveRecord::Migration
  def change
    rename_column :problems, :grid, :cells
  end
end
