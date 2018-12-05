class CreateAsignatures < ActiveRecord::Migration[5.2]
  def change
    create_table :asignatures do |t|
      t.string :name

      t.timestamps
    end
  end
end
