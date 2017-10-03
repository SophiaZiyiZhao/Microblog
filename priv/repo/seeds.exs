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

Repo.delete_all(User)

Repo.insert!(%User{email: "banana@icloud.com"})
Repo.insert!(%User{email: "apple@163.com"})

alias Microblog.Micro_blogging.Message
Repo.delete_all(Message)

Repo.insert!(%Message{content: "hello"})
Repo.insert!(%Message{content: "what??"})
