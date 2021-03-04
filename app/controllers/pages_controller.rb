class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @task = Task.new
    @tasks = policy_scope(Task).order(created_at: :desc)
  end
end
