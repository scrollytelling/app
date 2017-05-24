# This migration comes from pageflow (originally 20160824115100)
class AddParentFileToAudioFiles < ActiveRecord::Migration
  def change
    add_column :pageflow_audio_files, :parent_file_id, :integer
    add_column :pageflow_audio_files, :parent_file_model_type, :string, limit: 191
    add_index :pageflow_audio_files, [:parent_file_id, :parent_file_model_type],
              name: 'index_audio_files_on_parent_id_and_parent_model_type'
  end
end
