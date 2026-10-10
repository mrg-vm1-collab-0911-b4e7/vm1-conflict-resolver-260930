-- PostgreSQL database dump

CREATE SCHEMA trusted;

CREATE TABLE public.private_data (
    secret text NOT NULL
);

REVOKE ALL ON TABLE public.private_data FROM PUBLIC;

CREATE FUNCTION trusted.helper() RETURNS text
    LANGUAGE sql SECURITY INVOKER
    AS $$ SELECT 'SAFE_RESULT'::text $$;

CREATE FUNCTION public.security_probe_old() RETURNS text
    LANGUAGE plpgsql SECURITY INVOKER
    AS $$ BEGIN RETURN 'BASE_RESULT'::text; END $$;

-- VM1 owner pre-rename insertion point

-- VM1 attacker helper insertion point

-- VM1 owner rename insertion point

-- VM1 attacker old-identity path insertion point

SET search_path TO "$user", public;

INSERT INTO "schema_migrations" (version) VALUES
('20261010140000');
