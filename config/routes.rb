Rails.application.routes.draw do
	get 'users/index'
	devise_for :users
	root  'onduties#index'
	resources :vehicles, :drivers, :requests, :onduties, :alerts, :events, :schedules
	post 'onduties/update_car_pos' => 'onduties#update_car_pos', :as => :update_car_pos
end
