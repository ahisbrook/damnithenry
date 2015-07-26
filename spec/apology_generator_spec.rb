require "spec_helper"

describe ApologyGenerator do
  subject(:generator) { ApologyGenerator.new }

  describe "#generate" do
    it "integration" do
      input = "He stretched in my face and ate with his mouth open"
      expected_output = "I'm sorry for stretching in your face and eating with my mouth open. That was messed up of me."
      puts "     INPUT: '#{input}'"
      actual_output = generator.generate(input)
      puts "    OUTPUT: '#{actual_output}'"
      expect(actual_output).to eq(expected_output)
    end

    context "when input is invalid" do
      it "should return empty string for nil input" do
        expect(generator.generate(nil)).to eq('')
      end

      it "should respond to empty input" do
        expect(generator.generate('')).to eq("Hey! I didn't do nothing!")
      end
    end
  end

  describe "#remove_leading_identifier" do
    it "should remove leading 'he'" do
      expect(generator.remove_leading_identifier('he stretched')).to eq("stretched")
    end

    it "should remove leading 'henry'" do
      expect(generator.remove_leading_identifier('henry stretched')).to eq("stretched")
    end
  end

  describe "#change_person" do
      it "should replace 'he' with 'I'" do
        expect(generator.change_person('whistling while he worked')).to eq("whistling while I worked")
      end

      it "should replace 'his' with 'my'" do
        expect(generator.change_person('flexed his muscles')).to eq("flexed my muscles")
      end

      it "should replace 'my' with 'your'" do
        expect(generator.change_person('stealing my lunch')).to eq("stealing your lunch")
      end
  end

  describe "#conjugate" do
    context "when contains irregular verbs" do
      it "should conjugate to present tense" do
        expect(generator.conjugate('stole my sandwich')).to eq("stealing my sandwich")
      end
    end

    context "when contains regular verbs" do
      it "should conjugate to present tense" do
        expect(generator.conjugate('ruined my day')).to eq("ruining my day")
      end
    end
  end
end