Rails.application.routes.draw do
  # Rota para verificar a saúde da aplicação
  get "up" => "rails/health#show", as: :rails_health_check

  # Rotas RESTful para as traduções
  resources :translations, only: [:new, :create, :show]

  # Define a rota raiz da sua aplicação, se necessário
  # root "controller_name#action_name"
end

