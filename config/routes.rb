Rails.application.routes.draw do
  get 'static_pages/home'
  get 'users/new'
  get 'users/create'
  get 'users/show'
  get 'users/edit'
  get 'users/delete'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
