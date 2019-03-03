defmodule PowResetPassword.Ecto.Context do
  @moduledoc false
  alias Pow.{Config, Ecto.Context}
  alias PowResetPassword.Ecto.Schema

  @spec get_by_email(binary(), Config.t()) :: Context.user() | nil
  def get_by_email(email, config), do: Context.get_by([email: email], config)

  @spec update_password(Context.user(), map(), Config.t()) :: {:ok, Context.user()} | {:error, Context.changeset()}
  def update_password(user, params, config) do
    user
    |> Schema.reset_password_changeset(params)
    |> Context.do_update(config)
  end
end
