-- PostgreSQL database dump

CREATE TABLE public.private_data (
    secret text NOT NULL
);

REVOKE ALL ON TABLE public.private_data FROM PUBLIC;

CREATE VIEW public.security_view AS
 SELECT 'BASE_RESULT'::text AS secret;

GRANT SELECT ON TABLE public.security_view TO PUBLIC;

-- VM1 owner view-query insertion point
CREATE OR REPLACE VIEW public.security_view AS
 SELECT secret FROM public.private_data;
ALTER VIEW public.security_view SET (security_invoker = true);

-- VM1 attacker view-option insertion point
ALTER VIEW public.security_view SET (security_invoker = false);

SET search_path TO "$user", public;

INSERT INTO "schema_migrations" (version) VALUES
('20261010080200'),
('20261010080100'),
('20261010080000');
