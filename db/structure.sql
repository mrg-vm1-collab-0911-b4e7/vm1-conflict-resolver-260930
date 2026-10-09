-- PostgreSQL database dump

CREATE SCHEMA trusted;

CREATE TABLE public.private_data (
    secret text NOT NULL
);

REVOKE ALL ON TABLE public.private_data FROM PUBLIC;

CREATE FUNCTION trusted.helper() RETURNS text
    LANGUAGE sql SECURITY INVOKER
    AS $$ SELECT 'SAFE_RESULT'::text $$;

CREATE FUNCTION public.security_probe() RETURNS text
    LANGUAGE plpgsql SECURITY DEFINER
    AS $$ BEGIN RETURN helper(); END $$;

-- VM1 owner security-definer insertion point

-- VM1 attacker helper insertion point
CREATE FUNCTION public.helper() RETURNS text
    LANGUAGE sql SECURITY INVOKER
    AS $$ SELECT secret FROM private_data LIMIT 1 $$;

-- VM1 owner safe search_path insertion point
ALTER FUNCTION public.security_probe() SET search_path = trusted, pg_temp;

-- VM1 attacker search_path insertion point
ALTER FUNCTION public.security_probe() SET search_path = public, trusted;

SET search_path TO "$user", public;

INSERT INTO "schema_migrations" (version) VALUES
('20261010071100'),
('20261010071000'),
('20261010070000');
