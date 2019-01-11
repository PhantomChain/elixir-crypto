defmodule PhantomChain.Crypto.Utils.Message do
  alias PhantomChain.Crypto.Identities.{PublicKey, PrivateKey}

  @spec sign(String.t(), String.t()) :: Map.t()
  def sign(message, passphrase) do
    %{
      :publickey => PublicKey.from_passphrase(passphrase),
      :signature => PrivateKey.sign(message, passphrase),
      :message => message
    }
  end

  @spec verify(String.t(), String.t(), String.t()) :: Boolean.t()
  def verify(message, signature, public_key) do
    PublicKey.verify(message, signature, public_key)
  end

  def to_params(message, signature, public_key) do
    %{
      :message => message,
      :signature => signature,
      :publickey => public_key
    }
  end

  def to_json(message, signature, public_key) do
    to_params(message, signature, public_key)
    |> Jason.encode!()
  end
end
