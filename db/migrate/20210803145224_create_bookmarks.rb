class CreateBookmarks < ActiveRecord::Migration[6.0]
  def change
    create_table :bookmarks do |t|
      t.text :comment
      t.belongs_to :movie
      t.belongs_to :list

      t.timestamps
    end
  end
end
