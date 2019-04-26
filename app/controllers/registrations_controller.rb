class RegistrationsController < Devise::RegistrationsController
  def new
    super
  end

  def create
    build_resource(sign_up_params)

    code = sign_up_params[:code]
    admin = sign_up_params[:admin]
    @group = Group.where(code: code).first

    if (admin == 'true') or @group
      if resource.save
        # associate user with appropriate group
        if @group
          @group.users << resource

          strength_ids = [sign_up_params[:strength1], sign_up_params[:strength2], sign_up_params[:strength3],
                          sign_up_params[:strength4], sign_up_params[:strength5]]
          # strengths = []
          strength_ids.each do |s|
            # strengths << Strength.find(s)
            resource.strengths << Strength.find(s)
          end
        end

        yield resource if block_given?
        if resource.active_for_authentication?
          set_flash_message :notice, :signed_up if is_flashing_format?
          sign_up(resource_name, resource)

          respond_with resource, location: after_sign_up_path_for(resource)
        else
          set_flash_message :notice, :"signed_up_but_#{resource.inactive_message}" if is_flashing_format?
          expire_data_after_sign_in!
          respond_with resource, location: after_inactive_sign_up_path_for(resource)
        end
      else
        clean_up_passwords resource
        resource.errors.full_messages.each {|x| flash[x] = x} # Rails 4 simple way
      end
    else
      clean_up_passwords resource
      resource.errors.full_messages.each {|x| flash[x] = x} # Rails 4 simple way
    end
  end

  def update
    self.resource = resource_class.to_adapter.get!(send(:"current_#{resource_name}").to_key)
    prev_unconfirmed_email = resource.unconfirmed_email if resource.respond_to?(:unconfirmed_email)

    code = account_update_params[:code]
    @group = Group.where(code: code).first
    if @group
      @group.users << resource
    end

    strength_ids = [account_update_params[:strength1], account_update_params[:strength2], account_update_params[:strength3],
                    account_update_params[:strength4], account_update_params[:strength5]]
    resource.strengths = []
    strength_ids.each do |s|
      resource.strengths << Strength.find(s)
    end

    resource_updated = update_resource(resource, account_update_params)
    yield resource if block_given?
    if resource_updated
      #set_flash_message_for_update(resource, prev_unconfirmed_email)
      #bypass_sign_in resource, scope: resource_name if sign_in_after_change_password?

      respond_with resource, location: after_update_path_for(resource)
    else
      clean_up_passwords resource
      set_minimum_password_length
      respond_with resource
    end
  end

  private
    def sign_up_params
      allow = [:first_name, :last_name, :admin, :email, :password, :password_confirmation, :code, :strength1,
      :strength2, :strength3, :strength4, :strength5]
      params.require(resource_name).permit(allow)
    end

    def account_update_params
      params.require(resource_name).permit(:first_name, :last_name, :admin, :email, :password, :password_confirmation, :code, :strength1,
                                   :strength2, :strength3, :strength4, :strength5)
    end

  protected

    def update_resource(resource, params)
      resource.update_without_password(params)
    end

    def after_sign_up_path_for(resource)
      groups_path
    end
end
