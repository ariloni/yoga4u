class ChangeColumnNull < ActiveRecord::Migration
  def change
  	change_column_null :reviews, :by_user_id, false
  end
end
