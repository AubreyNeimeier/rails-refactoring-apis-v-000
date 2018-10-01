class SessionsController < ApplicationController
  skip_before_action :authenticate_user, only: :create

  def create
    github_repo = GithubService.new
    session[:token] = github_repo.authenticate!(ENV['GITHUB_CLIENT'], ENV['GITHUB_SECRET'], params[:code])
    session[:username] = github_repo.get_username
    redirect_to '/'
  end
end
