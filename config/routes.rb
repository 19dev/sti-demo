StiDemo::Application.routes.draw do
  get "employee/index"

  root :to => "employee#index"
end
