class ProfilesController < ApplicationController
    def show
        @profile = current_user.profile
        puts @profile.inspect
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
        if @profile.save(profile_params)
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
        params.require(:profile).permit(:name, :username, :user_id)
    end
end
