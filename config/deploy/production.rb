set :stage, :production
set :rails_env, :production
set :branch, "master"

server "68.183.153.53", user: "deploy", roles: %w{app db web},primary: true

