require 'spec_helper'

describe TrelloLeadTime::TimeHumanizer do
  describe ".humanize_seconds" do
    let(:seconds) { 428155 }
    subject { TrelloLeadTime::TimeHumanizer.humanize_seconds(seconds) }

    it "should have days, hours, mins, and seconds" do
      subject.should == "4 days 22 hours 55 minutes 55 seconds"
    end
  end
  describe ".humanize_to_days" do
    let(:seconds) { 424360 }
    subject { TrelloLeadTime::TimeHumanizer.humanize_to_days(seconds) }

    it "should have just days" do
      subject.should == "4.9"
    end
  end

  describe ".work_item" do
    context " that gets not an Issue as an input value" do
      let(:label) { "blah" }
      subject { TrelloLeadTime::TimeHumanizer.work_item(label) }
      it "should return Project" do
        subject.should == "Project"
      end
    end
    context " that gets an Issue as an input value" do
      let(:label) { " Issue " }
      subject { TrelloLeadTime::TimeHumanizer.work_item(label) }
      it "should return Incident" do
        subject.should == "Incident"
      end
    end
  end
end
