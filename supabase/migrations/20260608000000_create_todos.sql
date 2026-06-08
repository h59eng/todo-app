create table todos (
  id uuid primary key default gen_random_uuid(),
  text text not null,
  completed boolean not null default false,
  created_at timestamptz not null default now()
);

-- 인증 없이 읽기/쓰기 허용 (실습용)
alter table todos enable row level security;

create policy "Public access" on todos
  for all using (true) with check (true);
