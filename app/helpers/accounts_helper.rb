module AccountsHelper
  def get_create_account_button
    link_to "Create an account", new_user_account_path(current_user), class: "button [tiny small large]"
  end 

  def get_create_transaction_button
    link_to "Add a transaction", new_account_transaction_path(@account), class: "button [tiny small large]"
  end

  def get_edit_account_button(account)
    link_to tag('i', class: 'fi-page-edit'), edit_account_path(account), title: "Edit account"
  end

  def get_delete_account_button(account)
    link_to tag('i', class: 'fi-page-delete'), account_path(account), method: :delete, data: { confirm: 'Are you sure?' }, title: "Delete account"
  end
end
