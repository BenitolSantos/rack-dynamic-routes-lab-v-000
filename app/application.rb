class Application
  @@items = []

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    @@items.each do |item|
      resp.write "{item.name}\n"
    end

    if req.path.match(/items/)


    resp.finish
  end
  end
end
