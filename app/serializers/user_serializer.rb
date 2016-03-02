class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :name, :phone_number, :authentication_token, :created_at

  def authentication_token
    show_token = meta.try(:[], :show_token)
    show_token ? object.authentication_token : nil
  end  
end
