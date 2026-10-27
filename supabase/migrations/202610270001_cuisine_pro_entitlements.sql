-- Cuisine Pro commercial entitlement foundation
-- Run in Supabase SQL Editor. This creates a private per-user entitlement row.
-- IMPORTANT: this does NOT validate App Store / Google Play receipts.
-- Do not grant Premium by inserting rows manually for real customers.
create table if not exists public.cuisine_pro_entitlements (
  user_id uuid primary key references auth.users(id) on delete cascade,
  tier text not null default 'free' check (tier in ('free','premium')),
  status text not null default 'inactive' check (status in ('active','inactive','grace_period','cancelled','expired')),
  provider text check (provider in ('apple','google','admin')),
  product_id text,
  original_transaction_id text,
  purchase_token_hash text,
  expires_at timestamptz,
  updated_at timestamptz not null default now()
);
alter table public.cuisine_pro_entitlements enable row level security;
drop policy if exists "Users can read own Cuisine Pro entitlement" on public.cuisine_pro_entitlements;
create policy "Users can read own Cuisine Pro entitlement"
  on public.cuisine_pro_entitlements for select
  to authenticated using (auth.uid() = user_id);
-- No client insert/update/delete policies: only trusted server-side code with
-- the Supabase service role may write entitlement rows after validating receipts.
revoke insert, update, delete on public.cuisine_pro_entitlements from anon, authenticated;
grant select on public.cuisine_pro_entitlements to authenticated;
