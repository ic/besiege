require 'open3'

require 'sinatra/base'

module Besiege
  class App < Sinatra::Base

    get '/*' do
      response = ["<!DOCTYPE html><html><head></head><body><h1>Report</h1>"]
      Open3.popen3("siege -r10 -b -i -c50 -l/tmp/siege.log http://#{params[:splat].first}") do |sin, sout, serr, thr|
        status = thr.value
        lines = serr.readlines
        response.concat(lines[5..-1].map{|l| l.chomp + '<br />'})
      end
      response << "</body></html>"
      response.join
    end

  end
end

