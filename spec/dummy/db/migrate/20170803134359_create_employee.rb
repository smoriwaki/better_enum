class CreateEmployee < ActiveRecord::Migration[5.1]
  def change
    create_table :employees do |t|
      t.integer :gender
      t.integer :age
      t.string :name
    end
  end
end
