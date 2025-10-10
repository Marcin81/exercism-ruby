=begin
Write your code for the 'Hamming' exercise in this file. Make the tests in
`hamming_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/hamming` directory.
=end
class Hamming
  def self.compute(dna_chain_1, dna_chain_2)
    raise ArgumentError if dna_chain_1.length != dna_chain_2.length

    dna_chain_1.chars.zip(dna_chain_2.chars).count { |dna_part_1, dna_part_2| dna_part_1 != dna_part_2 }
  end
end