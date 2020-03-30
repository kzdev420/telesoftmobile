Rails.application.routes.draw do
  devise_for :users, :controllers => {:registrations => "users/registrations", :sessions => "users/sessions"}
  
  devise_scope :user do
    get '/resume' => 'users/registrations#resume', as: :resume
    post '/resume/uplaod' => 'users/registrations#resume_upload', as: :resume_uplaod
    get '/resume/uplaod' => 'users/registrations#resume'
    # root 'devise/sessions#new'
    root 'users/registrations#resume'
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
