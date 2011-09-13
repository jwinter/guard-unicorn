shared_context "processes" do

  let(:command) { subject.send(:command) }
  let(:pid) { 12345 }
  let(:process) { double(:pid => pid) }

  before do
    IO.stub(:popen).with(command).and_return(process)
  end

end
