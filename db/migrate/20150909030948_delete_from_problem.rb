class DeleteFromProblem < ActiveRecord::Migration
  def up
    execute <<-SQLEND
      DELETE FROM problems
    SQLEND
  end
end
