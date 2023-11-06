class PostsController < ApplicationController
    before_action :set_post, only: [:show]

    # GET /posts
    def index
      @posts = Post.all
    end
  
    # GET /posts/:id
    def show
        puts params
    end

    private

    def set_post
        puts "Find the post by id"
    end
end
