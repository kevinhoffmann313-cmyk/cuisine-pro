-- Cuisine Pro sync: per-user JSON data store.
create table if not exists public.cuisine_pro_data (
  user_id uuid primary key references auth.users(id) on delete cascade,
  payload jsonb not null default '{}'::jsonb,
  updated_at timestamptz not null default now()
);
alter table public.cuisine_pro_data enable row level security;
create policy "Users can read own Cuisine Pro data"
  on public.cuisine_pro_data for select to authenticated
  using (auth.uid() = user_id);
create policy "Users can insert own Cuisine Pro data"
  on public.cuisine_pro_data for insert to authenticated
  with check (auth.uid() = user_id);
create policy "Users can update own Cuisine Pro data"
  on public.cuisine_pro_data for update to authenticated
  using (auth.uid() = user_id) with check (auth.uid() = user_id);
