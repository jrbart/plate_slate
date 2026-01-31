defmodule PlateSlate.Repo.Migrations.CreateCategories do
  use Ecto.Migration

  def change do
    create table(:categories) do
      add :description, :string
      add :name, :string

      timestamps(type: :utc_datetime)
    end
  end
end
