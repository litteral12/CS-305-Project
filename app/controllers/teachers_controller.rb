class TeachersController < ApplicationController

	def new
		if session[:current_teacher_id] == nil
      		redirect_to root_url
   		end
		@teacher = Teacher.new()
	end

	def create

    @teacher = Teacher.new(params.require(:newteacher).permit(:firstname, :lastname, :email, :new_password, :new_password_confirmation, :super_box))
    
  	if @teacher.save
      redirect_to home_manage_path
  	else
    	render 'new'
  	end
	end

  def destroy
     @teacher = Teacher.find(params[:id])
     @teacher.destroy
 
  redirect_to home_manage_path
  end
end
