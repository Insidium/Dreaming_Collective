class ChangeColumnOnArtists < ActiveRecord::Migration[6.0]
  def change
    change_column_null :artists, :advocate_id, true
  end
end
