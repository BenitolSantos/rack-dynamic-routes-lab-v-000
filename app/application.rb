class Application
  @@items = []

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)
    resp.finish

    @@items.each do |item|
      resp.write "item.name"
    end
  end
end
