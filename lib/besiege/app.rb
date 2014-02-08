require 'open3'

require 'sinatra/base'
require 'haml'

module Besiege
  class App < Sinatra::Base

    configure do
      set :haml, :format => :html5
    end

    get '/' do
      haml :index
    end

    post '/load' do
      @url, @report = siege params[:url]
      haml :report
    end

    private
    def siege(url_string)
      url = ensure_protocol(url_string)
      response = []
      Open3.popen3("siege -r10 -b -i -c50 -l/tmp/siege.log #{url}") do |sin, sout, serr, thr|
        status = thr.value
        lines = serr.readlines
        response.concat(lines[5..-1].map{|l| l.chomp + '<br />'})
      end
      [url, response.join]
    end

    #
    # Ensure that there is a protocol name leading the supposed URL.
    #
    def ensure_protocol(url_string)
      case url_string
      when /^http/ then url_string
      else
        # Ensure only two slashes between protocol name and path.
        ('http://' + url_string).sub(/^http:\/\/\/+/, 'http://')
      end
    end

  end
end

