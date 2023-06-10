class CreateJobApplications < ActiveRecord::Migration[7.0]
  def change
    create_table :job_applications do |t|
      t.references :user, null: false, foreign_key: true
      t.references :job_post, null: false, foreign_key: true
      t.boolean :seen, null: false, default: false

      t.timestamps
    end
  end
end
