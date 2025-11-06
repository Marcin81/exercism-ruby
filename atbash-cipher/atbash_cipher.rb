=begin
Write your code for the 'Atbash Cipher' exercise in this file. Make the tests in
`atbash_cipher_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/atbash-cipher` directory.
=end

class Atbash
  def self.encode(plaintext)
    transcode(plaintext, selectors_chars, replacements_chars, group_output: true)
  end

  def self.decode(ciphertext)
    transcode(ciphertext, replacements_chars, selectors_chars)
  end

  def self.transcode(text, selectors, replacements, group_output: false)
    result = text.gsub(/\W+/, '').downcase.tr(selectors, replacements)
    group_output ? result.scan(/.{1,5}/).join(' ') : result
  end

  def self.selectors_chars
    ('a'..'z').to_a.join
  end

  def self.replacements_chars
    selectors_chars.reverse
  end

  private_class_method :transcode, :selectors_chars, :replacements_chars
end
