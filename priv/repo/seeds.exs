# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Microblog.Repo.insert!(%Microblog.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias Microblog.Repo
alias Microblog.Accounts.User

alias Microblog.Micro_blogging.Like
Repo.delete_all(Like)

Repo.insert!(%User{email: "admin@admin.com", is_admin?: true, password: "admin1234", password_confirmation: "admin1234"})
