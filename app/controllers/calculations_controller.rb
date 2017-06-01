class CalculationsController < ActionController::Base
  protect_from_forgery with: :exception

  def index
    require 'open-uri'

  	if params[:url]

        http = URI.parse(params[:url]) 

        cuelpo = http.read

        respuesta = cuelpo.match(/\<[Mm][Ee][Tt][Aa] property\=\"al:ios:url\"\ content\=\"(.*?)\"[\s\/\>|\/\>]/)

        if respuesta != nil 
          @respuesta = respuesta[1].to_s
        else
          @respuesta = "go home"
        end
    end

     respond_to do |format|
      	format.html { render html: @respuesta.to_s }
        format.json { render json: @respuesta.to_s }
    end

  end

end
