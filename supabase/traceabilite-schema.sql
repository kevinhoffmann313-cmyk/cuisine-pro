-- Cuisine Pro — préparation du schéma de traçabilité partagée
-- À examiner avant exécution : ce fichier n'a PAS été exécuté.
-- Authentification Supabase requise ; les photos restent dans un bucket privé.

create table if not exists public.traceability_records (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null references auth.users(id) on delete cascade,
  received_at date not null default current_date,
  product_type text not null check (product_type in ('viande', 'poisson', 'autre')),
  product_name text not null,
  supplier text,
  lot_number text,
  expiry_date date,
  quantity numeric(12,3),
  quantity_unit text not null default 'kg',
  notes text,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

create index if not exists traceability_records_user_received_idx
  on public.traceability_records (user_id, received_at desc);
create index if not exists traceability_records_user_lot_idx
  on public.traceability_records (user_id, lot_number);

alter table public.traceability_records enable row level security;

create policy "Users read their own traceability records"
  on public.traceability_records for select
  using (auth.uid() = user_id);
create policy "Users create their own traceability records"
  on public.traceability_records for insert
  with check (auth.uid() = user_id);
create policy "Users update their own traceability records"
  on public.traceability_records for update
  using (auth.uid() = user_id)
  with check (auth.uid() = user_id);
create policy "Users delete their own traceability records"
  on public.traceability_records for delete
  using (auth.uid() = user_id);

insert into storage.buckets (id, name, public)
values ('traceability-photos', 'traceability-photos', false)
on conflict (id) do nothing;

create policy "Users read their own traceability photos"
  on storage.objects for select
  using (
    bucket_id = 'traceability-photos'
    and (storage.foldername(name))[1] = auth.uid()::text
  );
create policy "Users upload their own traceability photos"
  on storage.objects for insert
  with check (
    bucket_id = 'traceability-photos'
    and (storage.foldername(name))[1] = auth.uid()::text
  );
create policy "Users update their own traceability photos"
  on storage.objects for update
  using (
    bucket_id = 'traceability-photos'
    and (storage.foldername(name))[1] = auth.uid()::text
  )
  with check (
    bucket_id = 'traceability-photos'
    and (storage.foldername(name))[1] = auth.uid()::text
  );
create policy "Users delete their own traceability photos"
  on storage.objects for delete
  using (
    bucket_id = 'traceability-photos'
    and (storage.foldername(name))[1] = auth.uid()::text
  );
