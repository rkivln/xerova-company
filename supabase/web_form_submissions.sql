create extension if not exists "pgcrypto";

create table if not exists public.web_form_submissions (
  id uuid primary key default gen_random_uuid(),
  full_name text not null,
  email text not null,
  phone text,
  company_name text,
  role text,
  found_us_via jsonb default '[]'::jsonb,
  project_types jsonb not null default '[]'::jsonb,
  project_name text,
  industry text,
  project_description text not null,
  has_existing_website boolean default false,
  current_website_url text,
  has_design_assets boolean default false,
  design_assets_type text,
  feature_requirements jsonb default '[]'::jsonb,
  target_platforms jsonb default '[]'::jsonb,
  content_readiness text,
  page_count integer,
  complexity_level text,
  estimated_timeline text,
  estimated_budget text,
  currency text,
  quote_preference text,
  budget_range text,
  preferred_launch_date date,
  timeline_flexibility text,
  needs_support boolean default false,
  support_plan text,
  communication_preference text,
  reference_links jsonb default '[]'::jsonb,
  additional_notes text,
  uploaded_files jsonb default '[]'::jsonb,
  submitted_at timestamptz default now()
);

alter table public.web_form_submissions enable row level security;

create policy "Allow public inserts for web form submissions"
on public.web_form_submissions
for insert
to anon
with check (true);
