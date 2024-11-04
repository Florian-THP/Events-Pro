class CreateUsers < ActiveRecord::Migration[7.2]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.text :description
      t.string :email, null: false, default: "", index: { unique: true } # Assurez-vous que l'email est unique
      t.string :encrypted_password, null: false, default: ""

      t.timestamps
    end
  end
end
