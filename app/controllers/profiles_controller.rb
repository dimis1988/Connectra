class ProfilesController < ApplicationController
    def show
        @post = Post.new
        @profile = Profile.find(params[:id])
        @posts = @profile.user.posts.order(created_at: :desc)
    end

    def new
        @profile = Profile.new
    end

    def create
        @profile = current_user.build_profile(profile_params)
        if @profile.save
            redirect_to profile_path
        else
            render :new
        end
    end

    def edit
        @profile = current_user.profile
    end

    def update
        @profile = current_user.profile
        if @profile.update(profile_params)
            redirect_to profile_path
        else
            render :new
        end
    end

    def destroy
       @profile = current_user.profile
       @profile.destroy
       @current_user.destroy
       redirect_to root_path
    end

    private

    def profile_params
        params.require(:profile).permit(:name, :username, :user_id, :avatar)
    end
end
