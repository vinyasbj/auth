class CreateAuthenticationTokens < ActiveRecord::Migration[5.2]
  def change
    create_table :authentication_tokens do |t|
      t.string :body
      t.integer :authenticable_id
      t.string  :authenticable_type
      t.datetime :last_used_at
      t.string :ip_address
      t.string :user_agent

      t.timestamps
    end
  end
end
