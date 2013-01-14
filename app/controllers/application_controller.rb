class ApplicationController < ActionController::Base
  protect_from_forgery
  
  def after_sign_in_path_for user
    root_path
  end
  
  def after_sign_out_path_for user
    new_user_session_path
  end

  def set_positions
    @positions = ["President", "VP of Operations", "VP of Marketing and Finance",
      "VP of Projects", "VP of Technology", "Project Leader", "Technology Chair",
      "Active Member"]
  end
end
