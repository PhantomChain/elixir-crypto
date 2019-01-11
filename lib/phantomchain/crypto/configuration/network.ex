defmodule PhantomChain.Crypto.Configuration.Network do
  alias PhantomChain.Crypto.Configuration.Configuration
  alias PhantomChain.Crypto.Networks

  def version() do
    get().version |> Base.decode16!(case: :lower)
  end

  def get() do
    network = Configuration.get_value(:network)

    if is_nil(network) do
      set(%Networks.Mainnet{})
    else
      network
    end
  end

  def set(network) do
    struct = Kernel.struct(network)
    Configuration.set_value(:network, struct)
  end
end
