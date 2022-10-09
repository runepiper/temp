# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Temp.Repo.insert!(%Temp.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias Temp.Accounts

for gender <- ~w(divers female male) do
  Accounts.create_gender!(gender)
end

for role <- ~w(admin trainer user) do
  Accounts.create_role!(role)
end