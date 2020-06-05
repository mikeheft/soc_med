class CreateSocMedFollows < ActiveRecord::Migration[6.0]
  def change
    create_table :soc_med_follows do |t|
      t.references :target, null: false, polymorphic: true
      t.references :owner, null: false, polymorphic: true

      t.timestamps
    end

    add_index :soc_med_follows, %i[target_id target_type owner_id owner_type], unique: true, name: :idx_soc_med_follows_on_target_and_owner
  end
end
