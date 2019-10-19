class Application

  @@items = ["Apples","Carrots","Pears"]
  @@cart = []

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items/)
      @@items.each do |item|
        resp.write "#{item}\n"
    end
    if req.path.match(/search/)
      search_term = req.params["q"]
      resp.write handle_search(search_term)

    elsif req.path.match(/cart/)
      if @@cart.empty?
        resp.write "cart is empty"
      else
        @@cart.each do |item|
          resp.write "#{item}\n"
      end
    end

    if req.path.match(/add/)
      @@item.each do |item|
        if @@item.include?(item)
          @@cart << item
        else
          resp.write "Item not found."
        end
      end
    resp.finish
    end

  def handle_search(search_term)
    if @@items.include?(search_term)
      return "#{search_term} is one of our items"
    else
      return "Couldn't find #{search_term}"
    end
  end
end
