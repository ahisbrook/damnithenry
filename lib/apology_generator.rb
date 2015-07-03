class ApologyGenerator
  EMPTY_INPUT_RESPONSE = "Hey! I didn't do nothing!"

  def generate(input)
    return '' unless input

    # remove trailing/leading whitespace
    input.strip!

    # if there is no input return response
    return EMPTY_INPUT_RESPONSE if input.empty?

    # downcase first letter
    input[0] = input[0].downcase

    # replace he with I
    input.gsub!(" he ", " I ")

    "I'm sorry for #{input}. That was messed up of me."
  end

  private

  def downcase_first_letter(input)
    input[0] = input[0].downcase
    input
  end
end