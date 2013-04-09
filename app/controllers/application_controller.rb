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

  def organize_in_rows(elements, per_row, options = {})
    options = { fill_out: false }.merge(options)
    in_rows = []
    if options[:fill_out]
      rem = elements.count % per_row
      extra = per_row - rem
      elements += [nil] * extra if extra != per_row
    end
    while not elements.empty?
      in_rows << elements.first(per_row)
      elements = elements.drop(per_row)
    end
    return in_rows
  end
end
