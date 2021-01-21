# copyright: 2020, Urs Voegele

title "check jenkins"

# check docker package
control "choco-1.0" do                         # A unique ID for this control
  impact 1.0                                   # The criticality, if this control fails.
  title "check if chocolatey is installed"     # A human-readable title
  desc "check chocolatey package"
  describe file('C:/ProgramData/chocolatey/choco.exe') do
    it { should exist }
    it { should be_file }
  end
end
