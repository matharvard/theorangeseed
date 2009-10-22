class CreateAccounts < ActiveRecord::Migration
  def self.up
    create_table(:accounts) do |t|
      t.string   :email
      t.string   :encrypted_password, :limit => 128
      t.string   :salt,               :limit => 128
      t.string   :remember_token,     :limit => 128
      t.timestamps
    end

    add_index :accounts, :id
    add_index :accounts, :email
    add_index :accounts, :remember_token
  end

  def self.down
    drop_table :accounts
  end
end
