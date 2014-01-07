module AccountsHelper
  def get_create_button
    link_to "Create an account", new_user_account_path(current_user), class: "button [tiny small large]"
  end 
end
