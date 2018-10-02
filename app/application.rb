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
      if 
      resp.write item.price #price and name are the two attributes of the item class
      elsif nil
        resp.write "Item not found"
        resp.status = 400
      else
      end
    else #returns 404 status code for a bad route
      resp.status = 404
      resp.write "Route not found"
    end

    resp.finish
  end
end
