require 'test_helper'

class NipTest < ActiveSupport::TestCase
  Valid   = %w(845-167-08-82 583-10-23-182 5840955985)
  Invalid = %w(123 845-167-00-00 000-111-22-33)

  test "number and to_s methods" do
    n = Nip.new('845-167-08-82')
    assert '8451670882', n.to_s
    n = Nip.new(8451670882)
    assert '8451670882', n.to_s
  end

  test "valid? method" do
    Valid.each do |number|
      n = Nip.new(number)
      assert n.valid?
    end

    Invalid.each do |number|
      n = Nip.new(number)
      assert_equal false, n.valid?
    end
  end
end
