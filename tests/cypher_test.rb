require 'minitest/autorun'
require_relative '../cypher'

class CypherTest < Minitest::Test
  def setup
    @key = "\x01\x23\x45\x67\x89\xAB\xCD\xEF\x01\x23\x45\x67\x89\xAB\xCD\xEF\x01\x23\x45\x67\x89\xAB\xCD\xEF\x01\x23\x45\x67\x89\xAB\xCD\xEF"
    @iv = 'my_iv_9876543210'
    @cypher = Cypher.new(@key, @iv)
  end

  def test_expected_Encode_ToBeValid
    # Arrange
    expected = '170e4354e8301a215b40411e5cfcc6d6'
    
    # Act
    plaintext = 'MY_SECRET'
    result = @cypher.Encode(plaintext)
    
    # Assert
    assert_equal expected, result
  end  

  def test_expected_Decode_ToBeValid
    # Arrange
    expected = 'MY_SECRET'

    # Act 
    ciphertext = '170e4354e8301a215b40411e5cfcc6d6'
    result = @cypher.Decode(ciphertext)

    # Assert
    assert_equal expected, result
  end

  def test_expected_Decode_ToBeNotValid
    # Arrange
    expected = 'MY_SECRET'

    # Act 
    badCypherText = '9f084519695ac6485e12cc09d2721f34'
    result = @cypher.Decode(badCypherText)
    
    # Assert
    refute_equal expected, result
  end

  def test_expected_Encode_ToBeNotValid
    # Arrange
    expected = '170e4354e8301a215b40411e5cfcc6d6'
    
    # Act
    badSecret = 'SECRET_NOT_VALID'
    result =  @cypher.Encode(badSecret)
    
    # Assert
    refute_equal expected, result
  end

  def test_expected_Verify_ToBeTrue
    # Arrange
    expected = 'MY_SECRET'
    @cypher.hash = '170e4354e8301a215b40411e5cfcc6d6'
    @cypher.secret = expected

    # Act 
    result = @cypher.Verify()

    # Assert
    assert_equal true, result, 'Test must be true'
  end
end