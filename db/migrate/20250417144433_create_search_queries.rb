class CreateSearchQueries < ActiveRecord::Migration[8.0]
  def change
    create_table :search_queries do |t|
      t.string :ip
      t.text :query

      t.timestamps
    end
  end
end
