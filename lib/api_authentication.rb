class ApiAuthentication < Faraday::Middleware
  def call(env)
    #TODO: Move key to credentials
    # env[:request_headers]["X-API-Token"] = 'XWny5j0V89yb1uZu6SI_D95EADV5FzBYldE9Ny0_q0GOzcWLiruPyhN-f2Pcyohf'
    byebug
    @app.call(env)
  end
end