defmodule Microblog.Repo.Migrations.CreateFollowers do
  use Ecto.Migration

  def change do
    create table(:followers) do

      timestamps()
    end

  end
end
