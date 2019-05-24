class ApplicationController < ActionController::API


    def encode_image
        file = params[:image].tempfile.open.read.force_encoding(Encoding::UTF_8)
        encoded = Base64.strict_encode64(file)
    end

end
