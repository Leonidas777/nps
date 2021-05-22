class CreateFeedbacks < ActiveRecord::Migration[6.1]
  def change
    create_table :feedbacks do |t|
      t.integer :score, null: false
      t.string :touchpoint, null: false
      t.string :respondent_class, null: false, limit: 50
      t.integer :respondent_id, null: false
      t.string :object_class, null: false, limit: 50
      t.integer :object_id, null: false

      t.timestamps
    end

    add_index :feedbacks, %i[respondent_class respondent_id]
    add_index :feedbacks, %i[object_class object_id]
    add_index :feedbacks, :touchpoint
  end
end
