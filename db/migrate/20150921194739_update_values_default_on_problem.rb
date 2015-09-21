class UpdateValuesDefaultOnProblem < ActiveRecord::Migration
  def change
    change_column_default :problems, :values, '[]'
  end
end
