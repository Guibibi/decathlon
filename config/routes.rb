Rails.application.routes.draw do
  get 'tags/:keyword', to: 'tags#list'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
