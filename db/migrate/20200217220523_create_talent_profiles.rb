class CreateTalentProfiles < ActiveRecord::Migration[6.0]
  def change
    create_table :talent_profiles do |t|
      t.belongs_to :user
      t.text :description
      t.string :headline
      t.decimal :rating
      t.text :skills, array: true, default: []

      t.timestamps
    end
  end
end
