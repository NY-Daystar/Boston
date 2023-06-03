require 'minitest/autorun'

require_relative '../util/__init__'

class UtilTest < Minitest::Test

  def test_expected_getTime_NotNil
    # Act
    result = Time.getTime()

    # Assert
    refute_nil result
  end  
end