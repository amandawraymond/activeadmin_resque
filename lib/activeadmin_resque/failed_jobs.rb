module ActiveadminResque::FailedJobs
  def self.register_page
    ActiveAdmin.register_page "Resque Failed Jobs" do
      menu parent: 'Resque', label: "Failed Jobs", priority: 3

      page_action :requeue do
        id = params[:id]
        Resque::Failure.requeue(id)
        Resque::Failure.remove(id)
        redirect_to admin_resque_failed_jobs_url
      end

      page_action :remove do
        id = params[:id]
        Resque::Failure.requeue(id)
        Resque::Failure.remove(id)
        redirect_to admin_resque_failed_jobs_url
      end

      content do
        if params[:id].present?
          render("admin/resque/failed_jobs/show", job: Resque::Failure.all(params[:id]))
        else
          render "admin/resque/failed_jobs/index"
        end
      end
    end
  end
end