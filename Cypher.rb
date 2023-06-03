require 'openssl'
require_relative 'util/__init__'

# Handle encoding of password
class Cypher
    attr_accessor :key, :hash, :iv, :secret
      
    # Initialize Cypher class with a key annd an init vector
    # @param key [String] cypher key
    # @param iv [String] init vector
    def initialize(key = nil, iv = nil)
        @key = key || "\x01\x23\x45\x67\x89\xAB\xCD\xEF\x01\x23\x45\x67\x89\xAB\xCD\xEF\x01\x23\x45\x67\x89\xAB\xCD\xEF\x01\x23\x45\x67\x89\xAB\xCD\xEF"
        @iv = iv || 'my_iv_9876543210'
    end
      
    # Encoding text with `AES-256-CBC` algorithm
    # @param plaintext [String] text to cypher
    # @return [String] cyphered text
    def Encode(plaintext)
        cipher = OpenSSL::Cipher.new('AES-256-CBC')
        cipher.encrypt
        cipher.key = @key
        cipher.iv = @iv
        encrypted = cipher.update(plaintext) + cipher.final
        @hash = encrypted.unpack('H*').first
    end
    
    # Decoding cyphered text using `AES-256-CBC` algorithms
    # @param ciphertext [String] cyphered text
    # @return [String] plaintext
    def Decode(ciphertext)
        cipher = OpenSSL::Cipher.new('AES-256-CBC')
        cipher.decrypt
        cipher.key = @key
        cipher.iv = @iv
        decrypted = cipher.update([ciphertext].pack('H*')) + cipher.final
        @secret = decrypted.force_encoding('UTF-8')
    end

    # Verify key with SHA-256
    # @return [Boolean] true if key matches hash, otherwise false
    def Verify()
        return Decode(@hash) == @secret
        #return Digest::SHA256.hexdigest(@key) == @hash
    end

    # Class method
    def self.Check()
        p "Valid method"
    end
end

if __FILE__ == $0
    if ARGV.count < 1 
        puts "Please put your secret like this : \n"+"$ ruby Cypher.rb <SECRET>".yellow
        exit()
    end

    encoded = Cypher.new().Encode(ARGV[0])
    puts "Your secret encoding is: #{encoded.yellow}"
end