class CreateRelationTypes < ActiveRecord::Migration
  def change
    create_table :relation_types do |t|

      t.timestamps

    end
  end
end
