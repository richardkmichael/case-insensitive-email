class CreateUsers < ActiveRecord::Migration
  def up
    create_table :users do |t|
      t.string :name
      t.string :email, null: false

      t.timestamps
    end

    execute 'CREATE UNIQUE INDEX users_email_lowercase ON users ( lower(email) );'
  end

  def down
    # Note: "DROP TABLE users;" will drop any indices on that table as well.
    #       With separate migrations for index creation, use:
    #         "execute 'DROP INDEX users_email_lowercase;'".
    drop_table :users
  end
end
