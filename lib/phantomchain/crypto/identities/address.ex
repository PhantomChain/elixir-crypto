defmodule PhantomChain.Crypto.Identities.Address do
  alias PhantomChain.Crypto.Helpers.Base58Check

  def from_passphrase(passphrase, network \\ nil) do
    passphrase
    |> PhantomChain.Crypto.Identities.PrivateKey.from_passphrase()
    |> from_private_key(network)
  end

  def from_public_key(public_key, network \\ nil) do
    network = network || PhantomChain.Crypto.Configuration.Network.version()

    public_key = Base.decode16(public_key, case: :lower)
    ripemd_public_key = :crypto.hash(:ripemd160, elem(public_key, 1))

    Base58Check.encode58check(network, ripemd_public_key)
  end

  def from_private_key(private_key, network \\ nil) do
    private_key
    |> PhantomChain.Crypto.Identities.PublicKey.from_private_key()
    |> from_public_key(network)
  end

  def validate(address, network \\ nil) do
    network = network || PhantomChain.Crypto.Configuration.Network.version()

    try do
      Base58Check.decode58check(address)
      |> String.first() == network
    rescue
      _ -> false
    end
  end
end
