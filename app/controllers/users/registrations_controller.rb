# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]
  def resume
    @resume = Resume.new
    @user = User.all
  end

  def resume_upload
    @resume = Resume.new(resume_params)
    @user = User.all
    if @resume.save
      pyscript_path = Rails.root.join('../telesoftmobile/python_script/main.py')
      resume_url = Rails.root.join('../telesoftmobile/public' + @resume.attachment_url)
      py_result = `python #{pyscript_path} #{resume_url}`.chomp
      puts py_result
      py_result = JSON.parse(py_result)
      @check_user = User.find_by(email: py_result["Email"])

      if @check_user
        @resume.destroy
        render "resume"
      else
        @user = User.new
        @user[:first_name] = py_result["First Name"]
        @user[:last_name] = py_result["Last Name"]
        @user[:email] = py_result["Email"]
        @user[:encrypted_password] = py_result["Password"]
        @user[:contact_number] = py_result["Contact Number"]
        @user[:correspondence_address] = py_result["Address"]
        @user[:correspondence_state] = py_result["Correspondence State"]
        @user[:correspondence_pincode] = py_result["Correspondence Pincode"]
        @user[:permanent_address] = py_result["Address_Permanent"]
        @user[:permanent_city] = py_result["Correspondence City"]
        @user[:permanent_state] = py_result["Permanent State"]
        @user[:permanent_pincode] = py_result["Permanent Pincode"]
        @user[:education] = py_result["Education Detail"]
        @user[:experience] = py_result["Experience Detail"]
        # @user[:certification] = py_result["certification"]
        @user[:current_ctc] = py_result["CTC"]
        # @user[:expected_ctc] = py_result["CTC"]
        # @user[:notice_period] = py_result["Correspondence City"]
        @user[:technical_skills] = py_result["Technical Skills"]
        @user[:skill_set] = py_result["Skills"]
        @user[:responsibilities] = py_result["Responsibilities"]
        @user[:linkedin_url] = py_result["LinkedIn"]
        @user[:strengths] = py_result["Strengths"]
        @user[:weaknesses] = py_result["Weakness"]
        @user[:hobbies] = py_result["Hobbies"]
        @user[:achievments] = py_result["Achievements"]
        @user[:professional_reference] = py_result["Professional Reference"]
        @user[:birthday] = py_result["DOB"]
        @user[:passport_number] = py_result["Passport"]
        @user[:language] = py_result["Languages"]
        # @user[:father_name] = py_result["Correspondence City"]
        # @user[:mother_name] = py_result["Correspondence City"]
        # @user[:blood_group] = py_result["Correspondence City"]
       
        render "new", locals: {user: @user}
      end
    else
      render "resume"
    end  
  end

  # GET /resource/sign_up
  def new
    respond_with @user
  end

  # POST /resource
  # def create
  #   super
  # end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end


  private
    def resume_params
      params.require(:resume).permit(:name, :attachment)
    end

    def sign_up_params
      params.require(:user).permit(:email, :password, :password_confirmation, :first_name, :last_name, :contact_number, :birthday, :hobbies)
    end
end
