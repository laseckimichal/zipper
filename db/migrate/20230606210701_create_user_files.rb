class CreateUserFiles < ActiveRecord::Migration[7.0]
  def change
    create_table :user_files do |t|
      t.string :file
      t.belongs_to :user

      t.timestamps
    end
  end
end
