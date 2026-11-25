-- Mission CP · Mike : table qui garde l'état de l'appli (scores, quiz en cours, séries de jours).
-- À coller dans Supabase : menu « SQL Editor » > « New query » > coller > « Run ».

create table if not exists public.mike_state (
  id text primary key,
  data jsonb not null,
  updated_at timestamptz not null default now()
);

alter table public.mike_state enable row level security;

drop policy if exists "mike_lecture" on public.mike_state;
drop policy if exists "mike_ajout" on public.mike_state;
drop policy if exists "mike_modification" on public.mike_state;

create policy "mike_lecture" on public.mike_state for select to anon using (true);
create policy "mike_ajout" on public.mike_state for insert to anon with check (true);
create policy "mike_modification" on public.mike_state for update to anon using (true) with check (true);
