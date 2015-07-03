require "spec_helper"

describe ApologyGenerator do
  subject(:generator) { ApologyGenerator.new }

  describe '#generate' do
    context "when input is invalid" do
      it "should return empty string for nil input" do
        expect(generator.generate(nil)).to eq('')
      end

      it "should respond to empty input" do
        expect(generator.generate('')).to eq("Hey! I didn't do nothing!")
      end
    end

    context "when input is valid" do
      it "should downcase first letter" do
        expect(generator.generate('Everything')).to eq("I'm sorry for everything. That was messed up of me.")
      end

      it "should replace 'he' with 'I'" do
        expect(generator.generate('whistling while he worked')).to eq("I'm sorry for whistling while I worked. That was messed up of me.")
      end

      it "should replace 'my' with 'your'" do
        expect(generator.generate('stealing my lunch')).to eq("I'm sorry for stealing your lunch. That was messed up of me.")
      end
    end
  end
end