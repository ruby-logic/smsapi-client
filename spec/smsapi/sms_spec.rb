require 'spec_helper'

describe Smsapi::SMS do
  describe "#deliver" do
    let(:sms) { Smsapi::SMS.new('to', 'message', server, {}) }
    let(:server) { instance_double(Smsapi::Server, sms: response) }

    subject { sms.deliver }

    context "success" do
      let(:response) { ["OK:7777:0.7"] }

      it { expect(subject).to be_success }
      it { expect(subject).not_to be_error }
      it { expect(subject.id).to eq('7777') }
      it { expect(subject.points).to eq(0.7) }
      it { expect(subject.error_code).to be_nil }
    end

    context "error" do
      let(:response) { ["ERROR:6666"] }

      it { expect(subject).not_to be_success }
      it { expect(subject).to be_error }
      it { expect(subject.id).to be_nil }
      it { expect(subject.points).to be_nil }
      it { expect(subject.error_code).to eq('6666') }
    end
  end
end
