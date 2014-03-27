PiggybakTaxonomy::Engine.routes.draw do
  get "/n/*path" => "navigation#show", :as => :piggybak_taxonomy
end
