class Application
  @@items = []

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    @@items.each do |item|
      resp.write "{item.name}\n"
    end

    if req.path.match(/items/)
      item_name = req.path.split(/items/).last
      item = @@items.find{|i| item.name == item_name}


    end

    resp.finish
  end
end
