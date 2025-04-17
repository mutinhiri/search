class CreateSearchParams < ActiveRecord::Migration[8.0]
  def change
    create_table :search_params do |t|
      t.string :ip
      t.text :last_search
      t.datetime :updated_at

      t.timestamps
    end
  end
end
