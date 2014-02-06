require 'open3'

require 'sinatra/base'
require 'haml'

module Besiege
  class App < Sinatra::Base

    configure do
      set :haml, :format => :html5
    end

    get '/*' do
      response = []
      Open3.popen3("siege -r10 -b -i -c50 -l/tmp/siege.log http://#{params[:splat].first}") do |sin, sout, serr, thr|
        status = thr.value
        lines = serr.readlines
        response.concat(lines[5..-1].map{|l| l.chomp + '<br />'})
      end
      @report = response.join
      haml :report
    end

  end
end

