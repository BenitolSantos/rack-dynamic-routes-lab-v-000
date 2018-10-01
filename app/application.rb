class Application
  @@items = []
  #Dynamic url routes call upon a different class and rb file
  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    @@items.each do |item|
      resp.write "{item.name}\n"
    end

    if req.path.match(/items/)
      item_name = req.path.split(/items/).last #uses regex to split and remove the folder
      #ex; turn /songs/Sorry into Sorry
      item = @@items.find{|i| item.name == item_name}
      resp.write item.price
    end

    resp.finish
  end
end
