-- PostgreSQL database dump

CREATE FUNCTION public.security_probe() RETURNS integer
    LANGUAGE sql
    AS $$ SELECT 1; $$;

-- Name: security_probe; Type: ACL; Schema: public
-- VM1 owner ACL hardening insertion point

-- VM1 attacker ACL compatibility insertion point
GRANT EXECUTE ON FUNCTION public.security_probe() TO PUBLIC;

SET search_path TO "$user", public;

INSERT INTO "schema_migrations" (version) VALUES
('20261010061100'),
('20261010060000');
