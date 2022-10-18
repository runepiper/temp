defmodule TempWeb.Router do
  use TempWeb, :router
  import Phoenix.LiveView.Router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, {TempWeb.LayoutView, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug TempWeb.AuthController
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  #open JSON-API scope for general Data handling (CR only!).
  scope "/api", TempWeb do
    pipe_through :api

    #roll dice (first JSON-API) test only!
    get "/roll", RollController, :index
    get "/roll/:num_dice", RollController, :show

    #show user via JSON
    resources "/users", API_UserController, only: [:show]

    #show sport via JSON
    resources "/sports", API_EnumController, [:show]
  end

  #protected JSON-API scope for sensible Data handling (CRUD).
  scope "/api", TempWeb do
    pipe_through :api
  end

  #general HTTP(S) scope (for site-access)
  scope "/", TempWeb do
    pipe_through :browser

    get "/", PageController, :index

    # User related routes (for login/granting further access)
    resources "/users", UserController, only: [:new, :create]
    resources "/sessions", SessionController, only: [:new, :create]
  end

  #protected HTTP(S) scope (access for management only)
  scope "/", TempWeb do
    pipe_through [:browser, :authentication]

    resources "/users", UserController, [:index, :show, :edit, :update, :delete]
    resources "/sessions", SessionController, only: [:index, :new, :create, :delete]

    #live view routes for different Enum Types (protected for logged in users only!)
    #live sports (for different courses)
    live "/sports", SportLive.Index, :index
    live "/sports/new", SportLive.Index, :new
    live "/sports/:id/edit", SportLive.Index, :edit

    live "/sports/:id", SportLive.Show, :show
    live "/sports/:id/show/edit", SportLive.Show, :edit

    #live agelevel (for different agelevels)
    live "/agelevels", AgeLevelLive.Index, :index
    live "/agelevels/new", AgeLevelLive.Index, :new
    live "/agelevels/:id/edit", AgeLevelLive.Index, :edit

    live "/agelevels/:id", AgeLevelLive.Show, :show
    live "/agelevels/:id/show/edit", AgeLevelLive.Show, :edit

    #live trainingtype (for different trainingtypes)
    live "/trainingtypes", TrainingTypeLive.Index, :index
    live "/trainingtypes/new", TrainingTypeLive.Index, :new
    live "/trainingtypes/:id/edit", TrainingTypeLive.Index, :edit

    live "/trainingtypes/:id", TrainingTypeLive.Show, :show
    live "/trainingtypes/:id/show/edit", TrainingTypeLive.Show, :edit

    #live league (for different leagues)
    live "/leagues", LeagueLive.Index, :index
    live "/leagues/new", LeagueLive.Index, :new
    live "/leagues/:id/edit", LeagueLive.Index, :edit

    live "/leagues/:id", LeagueLive.Show, :show
    live "/leagues/:id/show/edit", LeagueLive.Show, :edit
  end

  # Enables LiveDashboard only for development
  #
  # If you want to use the LiveDashboard in production, you should put
  # it behind authentication and allow only admins to access it.
  # If your application does not have an admins-only section yet,
  # you can use Plug.BasicAuth to set up some basic authentication
  # as long as you are also using SSL (which you should anyway).
  if Mix.env() in [:dev, :test] do
    import Phoenix.LiveDashboard.Router

    scope "/" do
      pipe_through :browser

      live_dashboard "/dashboard", metrics: TempWeb.Telemetry
    end
  end

  # Enables the Swoosh mailbox preview in development.
  #
  # Note that preview only shows emails that were sent by the same
  # node running the Phoenix server.
  if Mix.env() == :dev do
    scope "/dev" do
      pipe_through :browser

      forward "/mailbox", Plug.Swoosh.MailboxPreview
    end
  end
end
