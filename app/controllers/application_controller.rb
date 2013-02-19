class ApplicationController < ActionController::Base
  protect_from_forgery

  def after_sign_in_path_for user
    root_path
  end

  def after_sign_out_path_for user
    new_user_session_path
  end

  def confirm_user
    if not current_user.approved
      flash[:error] = "You haven't yet been approved!"
      redirect_to root_path
    end
  end

  def set_positions
    @positions = ["President", "VP of Operations", "VP of Marketing & Finance",
      "VP of Projects", "VP of Technology", "Project Leader", "Project Member",
      "Technology Chair", "Marketing Chair", "Faculty Sponsor"]
  end

end
