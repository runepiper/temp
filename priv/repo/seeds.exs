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


#populating for the Accounts/User Data tables
alias Temp.Accounts

for gender <- ~w(divers female male) do
  Accounts.create_gender!(gender)
end

for role <- ~w(admin trainer user) do
  Accounts.create_role!(role)
end

#populating for the Enum Data tables
alias Temp.Repo
alias Temp.Enum.{AgeLevel, League, Sport, TrainingType}

#populating values per type
age_level = ~w(u11 u15 u17 u19 u23 uXX)
league = ~w(local national international)
sport = ~w(basketball football handball squash)
training_type = ~w(agility endurance general speed strength tactics technique)

#Enum inserts for each data-table
Enum.each(age_level, fn  age_level ->
  Repo.insert!(%AgeLevel{agelevel: age_level})
end)

Enum.each(league, fn  league ->
  Repo.insert!(%League{league: league})
end)

Enum.each(sport, fn  sport ->
  Repo.insert!(%Sport{sport: sport})
end)

Enum.each(training_type, fn  training_type ->
  Repo.insert!(%TrainingType{trainingtype: training_type})
end)