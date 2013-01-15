class Rack::Trace::Middleware

  ASSET_PATH = File.expand_path("../../../web", __FILE__)

  def initialize(app, opts = {})
    @app = app

    @template = asset("rack-trace.html")
    @template.freeze
  end

  def call(env)
    Rack::Trace.cache.replace([])
    data = {}

    if env["PATH_INFO"] == "/__rack_trace.css"
      body = asset("rack-trace.css")
      head = { "Content-Length" => body.size.to_s, "Content-Type" => "text/css"}
      [200, head, [body]]

    elsif env["PATH_INFO"] == "/__rack_trace.js"
      body = asset("rack-trace.js")
      head = { "Content-Length" => body.size.to_s, "Content-Type" => "text/js" }
      [200, head, [body]]

    elsif /__rack_trace=(?<secret>[^&+])/ =~ env["QUERY_STRING"]
      data[:time0] = Time.now.to_f
      res = @app.call(env)
      data[:time1] = Time.now.to_f

      data[:trace] = Rack::Trace.cache

      render(data)
    else
      @app.call(env)
    end
  end

private

  def render(data)
    json = data.to_json
    body = @template.gsub("{{{JSON}}}", json)

    head = {
      "Content-Type" => "text/html",
      "Content-Length" => body.size.to_s
    }

    [200, head, [body]]
  end

  def asset(file)
    IO.read(File.join(ASSET_PATH, file))
  end

end
