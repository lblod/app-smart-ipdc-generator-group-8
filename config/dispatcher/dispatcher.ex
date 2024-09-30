defmodule Dispatcher do
  use Matcher
  define_accept_types [
    html: [ "text/html", "application/xhtml+html" ],
    json: [ "application/json", "application/vnd.api+json" ],
    any: [ "*/*" ]
  ]

  define_layers [ :static, :web_page, :api_services, :not_found ]


  ###############
  # SPARQL
  ###############
  match "/sparql", %{ layer: :sparql, accept: %{ any: true } } do
    forward conn, [], "http://database:8890/sparql"
  end

  ###############
  # API SERVICES
  ###############

  get "/concepts/*path", %{ layer: :api_services, accept: %{ json: true } } do
    Proxy.forward conn, path, "http://resource/concepts/"
  end

  get "/concept-schemes/*path", %{ layer: :api_services, accept: %{ json: true } } do
    Proxy.forward conn, path, "http://resource/concept-schemes/"
  end

  match "/public-services/*path", %{ layer: :api_services, accept: %{ json: true } } do
    Proxy.forward conn, path, "http://resource/public-services/"
  end

  match "/websites/*path", %{ layer: :api_services, accept: %{ json: true } } do
    Proxy.forward conn, path, "http://resource/websites/"
  end


  #################
  # NOT FOUND
  #################

  match "/*_", %{ layer: :not_found } do
    send_resp( conn, 404, "Route not found.  See config/dispatcher.ex" )
  end
end
