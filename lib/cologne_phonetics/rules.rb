module ColognePhonetics
  module Rules
    def self.define(&block)
      @rules = DSL.new(&block).rules
    end

    def self.apply_to(string)
      string = string.downcase.tr('ÄÖÜ', 'äöü') # Ruby < 2.3 downcases ASCII characters only
      chars = [nil] + string.chars + [nil]
      chars.each_cons(3).map{ |prev_char, char, next_char|
        code_for(prev_char, char, next_char)
      }.join
    end

    def self.code_for(prev_char, char, next_char)
      @rules.each do |matcher, code|
        return code if matcher.call(prev_char, char, next_char)
      end
      nil
    end

    class DSL
      attr_reader :rules

      def initialize(&block)
        @rules = []
        instance_exec(&block)
      end

      def change(chars, to:, before: nil, not_before: nil, after: nil, not_after: nil, initial: nil)
        matcher = ->(prev_char, char, next_char) {
          return unless chars.include?(char)
          return if initial && prev_char
          return if before && (!next_char || !before.include?(next_char))
          return if not_before && next_char && not_before.include?(next_char)
          return if after && (!prev_char || !after.include?(prev_char))
          return if not_after && prev_char && not_after.include?(prev_char)
          true
        }
        @rules << [matcher, to]
      end
    end
  end
end
