class ApplicationController < ActionController::API


    def encode_image
        file = params[:image].tempfile.open.read.force_encoding(Encoding::UTF_8)
        encoded = Base64.strict_encode64(file)
    end

    def get_current_user
        id = decode_token
        Admin.find_by(id: id)
      end
    
      def decode_token
        token = get_token
        begin
          data = JWT.decode(token, secret).first
          data['id']
        rescue
          nil
        end
      end
    
      def get_token
        request.headers['Authorization']
      end
    
      def issue_token(data)
        JWT.encode(data, secret)
      end
    
      def secret
        'shhh'
      end

end
