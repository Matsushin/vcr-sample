class CreateTokyometros < ActiveRecord::Migration
  def change
    create_table :tokyometros do |t|

      t.timestamps
    end
  end
end
