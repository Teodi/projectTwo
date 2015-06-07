 require "sinatra/base"
require "sinatra/reloader"

require_relative "db/connection"

module Teopedia
  class Server < Sinatra::Base

    configure do
      register Sinatra::Reloader
    end

    def logged_in?
      !current_user.nil?
    end

    #------HOMEPAGE----

    get '/' do
      erb :index
    end


    post '/users/login' do
      # get user from database with email and password
      @user = $db.exec_params("SELECT * FROM users WHERE username = $1
        AND password = $2", [params[:username], params[:password]])
      if @user.first.nil?
        redirect '/posts'
      else
        user_id = @user.first["id"]
        # redirect somewhere
        redirect "/users/#{user_id}"
      end
    end

    get '/posts' do
      @posts = $db.exec_params("SELECT * FROM posts")
      erb :posts
    end

    get '/posts/:id' do |id|
      @post = $db.exec_params("SELECT * FROM posts WHERE id = #{id}")
      @post = @post.entries[0]
      @user = $db.exec_params("SELECT * FROM users WHERE id = #{@post["user_id"]}")
      @user = @user.entries[0]
      @content = $db.exec_params("SELECT * FROM posts WHERE id = #{id}")
      @content = @content.entries[0]
      erb :post
    end

    post '/create_account' do
      erb :homepage
    end

    post '/create_post' do
      erb :create_post
    end

    get '/profile' do
      erb :profile
    end

    get '/edit_post' do
      @post = $db.exec_params("SELECT * FROM posts")
      erb :edit_post
    end

    get '/edit_post/:id' do |id|
      @post = $db.exec_params("SELECT * FROM posts WHERE id = #{id}")
      @post = @post.entries[0]
      @user = $db.exec_params("SELECT * FROM users WHERE id = #{@post["user_id"]}")
      @user = @user.entries[0]
      @content = $db.exec_params("SELECT * FROM posts WHERE id = #{id}")
      @content = @content.entries[0]
      erb :edit_post
    end


end
end


