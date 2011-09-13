require 'spec_helper'

describe Guard::Unicorn do

  describe "options" do

    describe "host" do
      
      it "should be '0.0.0.0' by default" do
        subject.options[:host].should == '0.0.0.0'
      end

      it "should be settable" do
        u = Guard::Unicorn.new([], { :host => '1.2.3.4' })
        u.options[:host].should == '1.2.3.4'
      end
    end

    describe "workers" do

      it "should default to 2" do
        subject.options[:workers].should == 2
      end

      it "should be settable" do
        u = Guard::Unicorn.new([], { :workers => 7 })
        u.options[:workers].should == 7
      end

    end

    describe "port" do
      
      it "should be '3000' by default" do
        subject.options[:port].should == 3000
      end

      it "should be settable" do
        u = Guard::Unicorn.new([], { :port => 5000 })
        u.options[:port].should == 5000
      end

    end

  end
end
