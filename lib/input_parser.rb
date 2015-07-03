class InputParser
  def reword(input)
    # downcase first letter
    input[0] = input[0].downcase

    # remove trailing/leading whitespace
    input.strip

    # replace he with I
    input.gsub(" he ", "I")

  end

  private

  def downcase_first_letter(input)
    input[0] = input[0].downcase
    input
  end
end