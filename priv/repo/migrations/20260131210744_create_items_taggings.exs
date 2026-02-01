defmodule PlateSlate.Repo.Migrations.CreateItemsTaggings do
  use Ecto.Migration

  def change do
    create table(:items_taggings) do
      add :item_id, references(:items, on_delete: :nothing)
      add :item_tag_id, references(:item_tags, on_delete: :nothing)
    end

    create index(:items_taggings, [:item_id])
    create index(:items_taggings, [:item_tag_id])
  end
end
