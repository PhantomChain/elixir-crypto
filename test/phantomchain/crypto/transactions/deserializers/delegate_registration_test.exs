defmodule PhantomChain.Crypto.Transactions.Deserializers.DelegateRegistrationTest do
  use ExUnit.Case, async: false
  alias PhantomChain.Crypto.Transactions.Deserializer
  alias PhantomChain.Crypto.Transactions.Transaction
  alias PhantomChain.Test.TestHelper

  test "should be ok if signed with a passphrase" do
    fixture = TestHelper.read_transaction_fixture("delegate_registration", "passphrase")
    actual = Deserializer.deserialize(fixture)

    assert(actual.version == 1)
    assert(actual.network == 30)
    assert(actual.type == fixture.data.type)
    assert(actual.timestamp == fixture.data.timestamp)
    assert(actual.sender_public_key == fixture.data.senderPublicKey)
    assert(actual.fee == fixture.data.fee)
    assert(actual.signature == fixture.data.signature)
    assert(actual.amount == fixture.data.amount)
    assert(actual.id == fixture.data.id)
    assert(actual.asset.delegate.username == fixture.data.asset.delegate.username)
    assert(Transaction.verify(actual) == true)
  end

  test "should be ok if signed with a second passphrase" do
    fixture = TestHelper.read_transaction_fixture("delegate_registration", "second-passphrase")
    actual = Deserializer.deserialize(fixture)

    assert(actual.version == 1)
    assert(actual.network == 30)
    assert(actual.type == fixture.data.type)
    assert(actual.timestamp == fixture.data.timestamp)
    assert(actual.sender_public_key == fixture.data.senderPublicKey)
    assert(actual.fee == fixture.data.fee)
    assert(actual.signature == fixture.data.signature)
    assert(actual.amount == fixture.data.amount)
    assert(actual.id == fixture.data.id)
    assert(actual.asset.delegate.username == fixture.data.asset.delegate.username)
    assert(Transaction.verify(actual) == true)
  end
end
