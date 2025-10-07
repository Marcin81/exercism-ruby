class SimpleCalculator
  ALLOWED_OPERATIONS = ['+', '/', '*'].freeze

  class UnsupportedOperation < ::StandardError
  end

  def self.calculate(first_operand, second_operand, operation)
    raise UnsupportedOperation unless ALLOWED_OPERATIONS.include?(operation)
    raise ArgumentError.new(first_operand) unless first_operand.kind_of?(Numeric)
    raise ArgumentError.new(second_operand) unless second_operand.kind_of?(Numeric)

    return "Division by zero is not allowed." if second_operand.zero? && operation == "/"

    result = first_operand.public_send(operation, second_operand)
    "#{first_operand} #{operation} #{second_operand} = #{result}"
  end
end
