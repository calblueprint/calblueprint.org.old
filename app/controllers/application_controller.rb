class ApplicationController < ActionController::Base
  protect_from_forgery
  include ApplicationHelper

  def after_sign_in_path_for user
    root_path
  end

  def after_sign_out_path_for user
    new_user_session_path
  end

  def activated_user!
    redirect_to root_path and return unless current_user
    redirect_to root_path, error: "You aren't activated!" unless current_user.is_activated
  end

  def admin_user!
    redirect_to root_path and return unless current_user
    redirect_to root_path, error: "You must be an admin to do that!" unless current_user.is_admin
  end

  def set_positions
    @positions = User.positions
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

