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
      if
      item_name = req.path.split(/items/).last #uses regex to split and remove the folder
      #ex; turn /songs/Sorry into Sorry
      item = @@items.find{|i| item.name == item_name}
      resp.write item.price #price and name are the two attributes of the item class
      else
        resp.status = 400
      end
    else #returns 404 status code for a bad route
      resp.status = 404
    end

    resp.finish
  end
end
