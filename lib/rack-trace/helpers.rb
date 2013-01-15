module Rack::Trace

  CACHE_KEY = "rack.trace"

  def self.trace(title, opts = {}, &block)
    opts[:title] ||= title

    opts[:time0] = Time.now.to_f
    res = block.call
    opts[:time1] = Time.now.to_f

    cache << opts
    res
  end

  def self.cache
    Thread.current[Rack::Trace::CACHE_KEY] ||= []
  end

end
