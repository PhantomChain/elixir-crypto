defmodule PhantomChain.Crypto.Identities.WIFTest do
  use ExUnit.Case
  alias PhantomChain.Crypto.Identities.WIF
  alias PhantomChain.Test.TestHelper

  setup_all do
    PhantomChain.Crypto.Configuration.Network.set(PhantomChain.Crypto.Networks.Devnet)

    :ok
  end

  test "should be able to calculate the WIF from passphrase" do
    fixture = TestHelper.read_fixture("identity")
    actual = WIF.from_passphrase(fixture.passphrase)

    assert(actual == fixture.data.wif)
  end
end
