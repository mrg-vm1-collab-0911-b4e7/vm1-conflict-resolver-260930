-- PostgreSQL database dump

CREATE TABLE public.private_data (
    secret text NOT NULL
);

REVOKE ALL ON TABLE public.private_data FROM PUBLIC;

CREATE FUNCTION public.trusted_guard(v text) RETURNS boolean
  LANGUAGE sql IMMUTABLE COST 1000
  AS $$ SELECT v = 'PUBLIC_RESULT' $$;

CREATE VIEW public.security_barrier_view_old AS
 SELECT 'BASE_RESULT'::text AS secret;

ALTER VIEW public.security_barrier_view_old SET (security_barrier = true);

GRANT SELECT ON TABLE public.security_barrier_view_old TO PUBLIC;

-- VM1 owner view-query insertion point
CREATE OR REPLACE VIEW public.security_barrier_view_old AS
 SELECT secret FROM public.private_data
 WHERE public.trusted_guard(secret);
ALTER VIEW public.security_barrier_view_old SET (security_barrier = true);

-- VM1 attacker view-option insertion point
ALTER VIEW public.security_barrier_view_old SET (security_barrier = false);

-- VM1 owner rename insertion point
ALTER VIEW public.security_barrier_view_old
  RENAME TO security_barrier_view_new;

SET search_path TO "$user", public;

INSERT INTO "schema_migrations" (version) VALUES
('20261010110200'),
('20261010110100'),
('20261010110000');
