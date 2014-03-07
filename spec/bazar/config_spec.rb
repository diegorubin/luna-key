require 'spec_helper'

describe Bazar::Config do

  context "on recover infos from config file" do

    it "get host address" do
      expect(Bazar::Config.host).to eql("http://localhost:3001")
    end

  end

end

