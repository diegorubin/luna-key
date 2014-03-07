require "spec_helper"

describe Bazar::User do

  context "on create" do
    let(:valid_user) do 
      Bazar::User.new({
        :email => "valid@email.com",
        :password => "umasenhadavalida",
        :password_confirmation => "umasenhadavalida"
      })
    end

    context "on invalid user" do

      it "return error if email blank" do
        user = valid_user
        user.email = ""
        expect(user.create).to false
      end

    end

  end

end

