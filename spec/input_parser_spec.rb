require "spec_helper"

describe InputParser do
  it "should talk to me" do
    input_parser = InputParser.new
    expect(input_parser.talk_to_me_goose).to eq("i love you maverick")
  end
end