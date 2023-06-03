
require 'openssl'
require_relative 'log'

# TODO test unitaires

# Handle encoding of password
class Cypher

    attr_accessor :key
    attr_accessor :hash
    attr_accessor :iv
    attr_accessor :secret
      
    # TODO english
    # Initialise la classe Cypher avec une clé et un vecteur d'initialisation
    #
    # @param key [String] la clé de chiffrement
    # @param iv [String] le vecteur d'initialisation
    def initialize(key = nil, iv = nil)
        @key = key unless @key = "\x01\x23\x45\x67\x89\xAB\xCD\xEF\x01\x23\x45\x67\x89\xAB\xCD\xEF\x01\x23\x45\x67\x89\xAB\xCD\xEF\x01\x23\x45\x67\x89\xAB\xCD\xEF"
        @iv = iv unless @iv = 'my_iv_9876543210'
    end
      
    # Encode le texte donné en utilisant l'algorithme AES-256-CBC
    #
    # @param plaintext [String] le texte à chiffrer
    # @return [String] le texte chiffré
    def Encode(plaintext)
        cipher = OpenSSL::Cipher.new('AES-256-CBC')
        cipher.encrypt
        cipher.key = @key
        cipher.iv = @iv
        encrypted = cipher.update(plaintext) + cipher.final
        @hash = encrypted.unpack('H*').first
    end
    
    # Décode le texte chiffré donné en utilisant l'algorithme AES-256-CBC
    #
    # @param ciphertext [String] le texte chiffré
    # @return [String] le texte déchiffré
    def Decode(ciphertext)
        cipher = OpenSSL::Cipher.new('AES-256-CBC')
        cipher.decrypt
        cipher.key = @key
        cipher.iv = @iv
        decrypted = cipher.update([ciphertext].pack('H*')) + cipher.final
        @secret = decrypted.force_encoding('UTF-8')
    end

    # TODO english
    # TODO a tester
    # Verify key with SHA-256
    # @return [Boolean] true if key matches hash, otherwise false
    def Verify()
        return Decode(@hash) == @secret
        #return Digest::SHA256.hexdigest(@key) == @hash
    end

    # Class method
    def self.Check()
        puts "Valid method"
    end
end

## TODO mettre un argument
## TODO readme arguument pour lancer l'encodagte
if __FILE__ == $0
    if ARGV.count < 1 
        puts "Please put your secret like this : \n"+"$ ruby Cypher.rb <SECRET>".yellow
        exit()
    end

    encoded = Cypher.new().Encode(ARGV[0])
    puts "Your secret encoding is: ", encoded.yellow
end