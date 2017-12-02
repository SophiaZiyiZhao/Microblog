defmodule Microblog.Repo.Migrations.CreateFollowers do
  use Ecto.Migration

  def change do
    create table(:followers) do
     add :follower_id, references(:users, on_delete: :nothing)
     add :following_id, references(:users, on_delete: :nothing)
      timestamps()
    end
   end
end
