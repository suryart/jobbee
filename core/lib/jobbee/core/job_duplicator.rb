module Jobbee
  class JobDuplicator
    attr_accessor :job

    def initialize(job)
      @job = job
    end

    def duplicate
      new_job = duplicate_job

      # allow site to do some customization
      new_job.send(:duplicate_extra, job) if new_job.respond_to?(:duplicate_extra)
      new_job.save!
      new_job
    end

    protected

    def duplicate_job
      job.dup.tap do |new_job|
        new_job.name = "COPY OF #{job.name}"
        new_job.description = "COPY OF #{job.description}"
        
        new_job.created_at = nil
        new_job.deleted_at = nil
        new_job.updated_at = nil

        new_job.cities = reset_associations(job.cities)
        new_job.job_categories = job.job_categories
        new_job.educations = reset_associations(job.educations)
        new_job.applications = reset_associations(job.applications)

        new_job.job_type = job.job_type
        new_job.job_status = job.job_status
        new_job.company = job.company
        new_job.job_experience = job.job_experience
        
        new_job.images = job.images.map { |image| duplicate_image image }
      end
    end

    def duplicate_image(image)
      new_image = image.dup
      new_image.assign_attributes(:attachment => image.attachment.clone)
      new_image
    end

    def reset_associations(associations)
      associations.map do |association|
        association.dup.tap do |new_association|
          new_association.created_at = nil
          new_association.updated_at = nil
        end
      end
    end
  end
end