class JobbeeBasicTables < ActiveRecord::Migration
  def change
    create_table :jobbee_jobs do |t|
      t.string     :name, :default => '', :null => false
      t.text       :description
      t.datetime   :available_on
      t.datetime   :expires_on
      t.datetime   :deleted_at
      t.string     :permalink
      t.string     :meta_description
      t.string     :meta_keywords
      t.references :company
      t.references :job_category
      t.references :job_experience
      t.references :job_status
      t.references :job_type
      t.integer    :openings, :default => 0,  :null => false
      t.boolean    :active,   :default => true
      t.integer    :position, :default => 0,  :null => false

      t.timestamps
    end

    add_index :jobbee_jobs, [:available_on],      :name => 'index_jobbee_jobs_on_available_on'
    add_index :jobbee_jobs, [:deleted_at],        :name => 'index_jobbee_jobs_on_deleted_at'
    add_index :jobbee_jobs, [:name],              :name => 'index_jobbee_jobs_on_name'
    add_index :jobbee_jobs, [:permalink],         :name => 'index_jobbee_jobs_on_permalink'
    add_index :jobbee_jobs, [:company_id],         :name => 'index_jobbee_jobs_on_company_id'
    add_index :jobbee_jobs, [:job_category_id],   :name => 'index_jobbee_jobs_on_job_category_id'
    add_index :jobbee_jobs, [:job_experience_id], :name => 'index_jobbee_jobs_on_job_experience_id'
    add_index :jobbee_jobs, [:job_status_id],     :name => 'index_jobbee_jobs_on_job_status_id'
    add_index :jobbee_jobs, [:job_type_id],       :name => 'index_jobbee_jobs_on_job_type_id'

    create_table :jobbee_companies do |t|
      t.string :name
      t.string :permalink
      t.text :description
      t.string :homepage

      t.timestamps
    end

    create_table :jobbee_job_categories do |t|
      t.references :job
      t.references :category
      t.integer :position

      t.timestamps
    end

    add_index :jobbee_job_categories, [:job_id], :name => 'index_job_categories_on_job_id'

    create_table :jobbee_educations do |t|
      t.string  :name, :default => '', :nil => false
      t.string  :presentation, :default => '', :nil => false
      t.boolean :active

      t.timestamps
    end

    create_table :jobbee_job_types do |t|
      t.string  :name, :default => '', :nil => false
      t.string  :presentation, :default => '', :nil => false
      t.boolean :active

      t.timestamps
    end

    create_table :jobbee_job_statuses do |t|
      t.string  :name, :default => '', :nil => false
      t.string  :presentation, :default => '', :nil => false
      t.boolean :active

      t.timestamps
    end

    create_table :jobbee_job_experiences do |t|
      t.string  :name, :default => '', :nil => false
      t.string  :presentation, :default => '', :nil => false
      t.boolean :active

      t.timestamps
    end

    create_table :jobbee_categories do |t|
      t.string  :name, :default => '', :null => false
      t.string  :presentation
      t.text    :description
      t.integer :position

      t.timestamps
    end

    create_table :jobbee_cities do |t|
      t.string  :name, :default => '', :nil => false
      t.string  :abbr
      t.references :states

      t.timestamps
    end

    create_table :jobbee_states do |t|
      t.string     :name, :default => '', :nil => false
      t.string     :abbr
      t.references :country

      t.timestamps
    end

    create_table :jobbee_countries do |t|
      t.string  :iso_name
      t.string  :iso
      t.string  :iso3
      t.string  :name, :default => '', :nil => false
      t.integer :numcode

      t.timestamps
    end

    create_table :jobbee_job_cities do |t|
      t.references :job
      t.references :city
      t.integer :position

      t.timestamps
    end

    add_index :jobbee_job_cities, [:job_id], :name => 'index_job_cities_on_job_id'

    create_table :jobbee_assets do |t|
      t.references :viewable,               :polymorphic => true
      t.integer    :attachment_width
      t.integer    :attachment_height
      t.integer    :attachment_file_size
      t.integer    :position
      t.string     :attachment_content_type
      t.string     :attachment_file_name
      t.string     :type,                   :limit => 75
      t.datetime   :attachment_updated_at
      t.text       :alt

      t.timestamps
    end

    add_index :jobbee_assets, [:viewable_id],          :name => 'index_assets_on_viewable_id'
    add_index :jobbee_assets, [:viewable_type, :type], :name => 'index_assets_on_viewable_type_and_type'

    create_table :jobbee_job_applicants do |t|
      t.string   :firstname, :default => '', :null => false
      t.string   :lastname, :default => '', :null => false
      t.datetime :dob, :null => false
      t.string   :email, :default => '', :null => false
      t.text     :address, :default => '', :null => false
      t.integer  :contact_number, :null => false

      t.timestamps
    end
  end
end
