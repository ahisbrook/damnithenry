require 'yaml'

class ApologyGenerator
    RESOURCES_DIR = File.expand_path('../resources', __FILE__)
    EMPTY_INPUT_RESPONSE = "Hey! I didn't do nothing!"

    def initialize
      @irregular_verbs = YAML.load_file("#{RESOURCES_DIR}/irregular_verbs.yml")
    end

    def generate(input)
      return '' unless input

      # remove trailing/leading whitespace
      input.strip!

      # if there is no input return response
      return EMPTY_INPUT_RESPONSE if input.empty?

      # downcase
      input = input.downcase

      # remove leading identifiers
      input = remove_leading_identifier(input)

      # change perspective from user to Henry
      change_person(input)

      # conjugate past tense verbs
      conjugate(input)

      "I'm sorry for #{input}. That was messed up of me."
    end

    def remove_leading_identifier(input)
      input = input.slice(3..-1) if input.start_with?("he ")
      input = input.slice(6..-1) if input.start_with?("henry ")
      input
    end

    def conjugate(input)
      words = input.split(' ')
      @irregular_verbs.each do |verb|
        input_verb = words.find { |word| verb[:past].include?(word) }
        input.gsub!(input_verb, verb[:present]) if input_verb
      end

      input.gsub!("ed ", "ing ")

      input
    end

    def change_person(input)
      # replace he with I
      input.gsub!(" he ", " I ")

      # replace my with your
      input.gsub!(" my ", " your ")

      # replace his with my
      input.gsub!(" his ", " my ")

      input
    end
end