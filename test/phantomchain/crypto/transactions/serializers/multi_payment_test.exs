defmodule PhantomChain.Crypto.Transactions.Serializers.MultiPaymentTest do
  use ExUnit.Case, async: false
  alias PhantomChain.Crypto.Transactions.Serializer
  alias PhantomChain.Test.TestHelper

  setup_all do
    PhantomChain.Crypto.Configuration.Network.set(PhantomChain.Crypto.Networks.Devnet)

    :ok
  end

  @tag :skip
  test "should be ok" do
    fixture = TestHelper.read_transaction_fixture("multi_payment", "passphrase")
    actual = Serializer.serialize(fixture.data, %{underscore: true})

    assert(actual == fixture.serialized)
  end
end
