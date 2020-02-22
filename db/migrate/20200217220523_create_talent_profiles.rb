class CreateTalentProfiles < ActiveRecord::Migration[6.0]
  def change
    create_table :talent_profiles do |t|
      t.integer :user_id null: false
      t.text :description
      t.text :skills, array: true, default: []

      t.timestamps
    end
  end
end
