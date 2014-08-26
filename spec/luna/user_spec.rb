require "spec_helper"

describe Luna::User do

  context "on create" do

    let(:valid_user) do 
      Luna::User.new({
        email: "valid@email.com",
        password: "umasenhadavalida",
        password_confirmation: "umasenhadavalida"
      })
    end

    let(:connection) do
      Faraday.new do |builder|
        builder.response :json

        builder.adapter :test do |stubs|
          stubs.post("/api/v1/users", {
            user: {
              email: "", 
              password: "umasenhadavalida",
              password_confirmation: "umasenhadavalida"
            }
          }) { [200, {}, nil] }
        end
      end
    end

    context "on invalid user" do

      it "return error if email blank" do
        user = valid_user
        user.email = ""


        user.stub(:connection).and_return(connection)
        expect(user.create).to false
      end

    end

  end

end

