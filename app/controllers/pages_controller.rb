class PagesController < ApplicationController
  before_action :find_accounts, only: [:reports]
  before_filter :authenticate_user!, only: [:overview, :reports, :moar, :associations]

  def homepage
    render
  end

  # def overview
  #   render
  # end

  def reports
    @month = view_context.get_current_month
  end

  def features
    render
  end

  def contact
    render
  end

  def moar
    render
  end

  def associations
    render
  end

  private

  def find_accounts
    @user = User.find(current_user)
    @accounts = @user.accounts
  end
end
