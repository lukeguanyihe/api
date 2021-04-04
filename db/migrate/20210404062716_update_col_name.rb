class UpdateColName < ActiveRecord::Migration[6.1]
  def change
    rename_column :comments, :context, :content

  end
end
