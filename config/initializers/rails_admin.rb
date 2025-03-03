RailsAdmin.config do |config|

  ### Popular gems integration

  ## == Devise ==
  config.authenticate_with do
    warden.authenticate! scope: :user
  end
  config.current_user_method(&:current_user)

  ## == Cancan ==
  # config.authorize_with :cancan

  ## == Pundit ==
  # config.authorize_with :pundit
  
  # config.authorize_with do
  #   redirect_to main_app.root_path, error: 'You are not authorized to perform this action.' unless current_user.admin?
  # end

  ## == PaperTrail ==
  # config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  ### More at https://github.com/sferik/rails_admin/wiki/Base-configuration

  ## == Gravatar integration ==
  ## To disable Gravatar integration in Navigation Bar set to false
  # config.show_gravatar true

  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new
    export
    bulk_delete
    show
    edit
    delete
    show_in_app
  end

  config.model 'Installation' do
    list do
      field :display_name
      field :locality
      field :active
      field :active_at
    end

    edit do
      field :display_name
      field :locality
      field :latitude do 
        required true
      end  
      field :longitude do 
        required true
      end  
      field :active
      field :active_at
    end
  end
end
