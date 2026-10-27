-- Cuisine Pro — stockage cloud privé par utilisateur
-- À exécuter dans Supabase > SQL Editor après vérification.
-- Cette table synchronise les données structurées de l'application (recettes, tâches,
-- températures, réceptions, listes et productions). Les photos IndexedDB nécessitent
-- une synchronisation Storage séparée et ne sont PAS couvertes par cette table.

create table if not exists public.cuisine_pro_user_data (
  user_id uuid primary key references auth.users(id) on delete cascade,
  payload jsonb not null,
  updated_at timestamptz not null default now()
);

alter table public.cuisine_pro_user_data enable row level security;

drop policy if exists "Users can read own Cuisine Pro data" on public.cuisine_pro_user_data;
create policy "Users can read own Cuisine Pro data"
  on public.cuisine_pro_user_data for select
  using (auth.uid() = user_id);

drop policy if exists "Users can insert own Cuisine Pro data" on public.cuisine_pro_user_data;
create policy "Users can insert own Cuisine Pro data"
  on public.cuisine_pro_user_data for insert
  with check (auth.uid() = user_id);

drop policy if exists "Users can update own Cuisine Pro data" on public.cuisine_pro_user_data;
create policy "Users can update own Cuisine Pro data"
  on public.cuisine_pro_user_data for update
  using (auth.uid() = user_id)
  with check (auth.uid() = user_id);

drop policy if exists "Users can delete own Cuisine Pro data" on public.cuisine_pro_user_data;
create policy "Users can delete own Cuisine Pro data"
  on public.cuisine_pro_user_data for delete
  using (auth.uid() = user_id);

create or replace function public.set_cuisine_pro_user_data_updated_at()
returns trigger
language plpgsql
set search_path = public
as $$
begin
  new.updated_at = now();
  return new;
end;
$$;

drop trigger if exists cuisine_pro_user_data_updated_at on public.cuisine_pro_user_data;
create trigger cuisine_pro_user_data_updated_at
  before update on public.cuisine_pro_user_data
  for each row execute function public.set_cuisine_pro_user_data_updated_at();

-- Défense supplémentaire : aucune donnée n'est accessible sans session authentifiée.
