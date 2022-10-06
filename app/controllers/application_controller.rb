class ApplicationController < ActionController::Base
  include Pundit::Authorization

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  after_action :verify_authorized, except: :index, unless: :devise_controller?
  after_action :verify_policy_scoped, only: :index, unless: :devise_controller?

  private

  def user_not_authorized
    # This application uses the Rails default of increasing numeric IDs for
    # records in the database.
    #
    # This means there are security implications to how you inform a user that
    # they are not authorized. If this app returns a different error message
    # depending on whether the resource exists or not, then a (potentially
    # malicious) user could use the different error messages to discover how
    # many instances of a model exist in the database. Depending on the context,
    # this could be a serious security issue e.g.
    #
    # * a competitor could find out how many users have signed up
    # * an attacker could guess what the next user ID would be which might be
    #   useful to them in another context
    #
    # This template defaults to the more secure (but less user-friendly) option
    # of making Pundit authorization errors look like
    # ActiveRecord::RecordNotFound errors (returning the standard Rails 404
    # page). You may choose to use the more user-friendly version in your
    # application but be aware of the security consequences and that the team
    # will almost certainly have to defend the choice in a penetration test.

    # The more secure but less user-friendly option (our default):
    # ############################################################
    fail ActiveRecord::RecordNotFound

    # The user-friendly but less secure option:
    # #########################################
    # flash[:alert] = I18n.t("authorization.not_authorized")
    # redirect_to(request.referer || root_path)
  end
end
