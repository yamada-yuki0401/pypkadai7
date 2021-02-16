class AddOpinionToBook < ActiveRecord::Migration[5.2]
  def change
    rename_column :books, :bo, :body
  end
end
