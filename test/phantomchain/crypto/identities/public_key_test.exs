defmodule PhantomChain.Crypto.Identities.PublicKeyTest do
  use ExUnit.Case
  alias PhantomChain.Crypto.Identities.PublicKey
  alias PhantomChain.Test.TestHelper

  setup_all do
    PhantomChain.Crypto.Configuration.Network.set(PhantomChain.Crypto.Networks.Devnet)

    :ok
  end

  test "should be able to calculate the public key from passphrase" do
    fixture = TestHelper.read_fixture("identity")
    actual = PublicKey.from_passphrase(fixture.passphrase)

    assert(actual == fixture.data.publicKey)
  end

  test "should be able to calculate the public key from hex" do
    fixture = TestHelper.read_fixture("identity")
    actual = PublicKey.from_hex(fixture.data.publicKey)

    assert(Base.encode16(actual, case: :lower) == fixture.data.publicKey)
  end
end
