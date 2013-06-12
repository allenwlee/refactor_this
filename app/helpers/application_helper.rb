module ApplicationHelper
  def convert_status
    STATUSES.key(params[:todo][:status])
  end
end
