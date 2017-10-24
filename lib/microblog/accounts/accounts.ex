defmodule Microblog.Accounts do
 
  import Ecto.Query, warn: false
  alias Microblog.Repo
  alias Microblog.Accounts.User

  @doc """
  Returns the list of users.
  """

  def list_users do
    Repo.all(User)
  end

  @doc """
  Gets a single user.
 """

  def get_user!(id), do: Repo.get!(User, id)

  def get_user_by_email!(email) do
    Repo.get_by(User, email: email)
  end

  @doc """
  Creates a user.
  """

  def create_user(attrs \\ %{}) do
    %User{}
    |> User.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a user.

  ## Examples

      iex> update_user(user, %{field: new_value})
      {:ok, %User{}}

      iex> update_user(user, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_user(%User{} = user, attrs) do
    user
    |> User.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a User.

  ## Examples

      iex> delete_user(user)
      {:ok, %User{}}

      iex> delete_user(user)
      {:error, %Ecto.Changeset{}}

  """
  def delete_user(%User{} = user) do
    Repo.delete(user)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking user changes.

  ## Examples

      iex> change_user(user)
      %Ecto.Changeset{source: %User{}}

  """
  def change_user(%User{} = user) do
    User.changeset(user, %{})
  end
end
