defmodule PhantomChain.Crypto.Identities.AddressTest do
  use ExUnit.Case
  alias PhantomChain.Crypto.Identities.Address
  alias PhantomChain.Test.TestHelper

  setup_all do
    PhantomChain.Crypto.Configuration.Network.set(PhantomChain.Crypto.Networks.Devnet)

    :ok
  end

  test "should be able to calculate the address from passphrase" do
    fixture = TestHelper.read_fixture("identity")
    actual = Address.from_passphrase(fixture.passphrase)

    assert(actual == fixture.data.address)
  end

  test "should be able to calculate the address from public key" do
    fixture = TestHelper.read_fixture("identity")
    actual = Address.from_public_key(fixture.data.publicKey)

    assert(actual == fixture.data.address)
  end

  test "should be able to calculate the address from private key" do
    fixture = TestHelper.read_fixture("identity")
    actual = Address.from_private_key(fixture.data.privateKey)

    assert(actual == fixture.data.address)
  end

  test "should be able to validate the address" do
    fixture = TestHelper.read_transaction_fixture("transfer", "passphrase")
    actual = Address.validate(fixture.data.recipientId)

    assert(actual == true)
  end
end
