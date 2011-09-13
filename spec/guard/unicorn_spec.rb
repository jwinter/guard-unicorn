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
      
      it "should be '8080' by default" do
        subject.options[:port].should == 8080
      end

      it "should be settable" do
        u = Guard::Unicorn.new([], { :port => 5000 })
        u.options[:port].should == 5000
      end

    end

    describe "config_file" do

      it "should default to nil" do
        subject.options[:config_file].should be_nil
      end

      it "should be settable" do
        u = Guard::Unicorn.new([], { :config_file => "/path/to/config" })
        u.options[:config_file].should == "/path/to/config"
      end
    end

  end

  describe "start" do
    include_context "processes"

    context "when not already running" do

      before do
        subject.stub(:port_open?).and_return(true)
      end

      it "should set the pid" do
        subject.start
        subject.pid.should eq(pid)
      end
      
      it "should wait_for_port" do
        subject.should_receive(:wait_for_port)
        subject.start
      end

    end

    context "when running" do
      before do
        subject.stub(:running?).and_return(true)
      end

      it "should return false" do
        subject.start.should be_false
      end

    end
    
  end

  describe "stop" do

    include_context "processes"

    before do
      subject.instance_variable_set(:@pid, pid)
    end

    it "should kill the process" do
      Process.should_receive(:kill).with("TERM", pid)
      Process.should_receive(:wait).with(pid)
      subject.stop.should be_true
      subject.pid.should be_nil
    end

  end

end
