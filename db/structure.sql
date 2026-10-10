-- PostgreSQL database dump

CREATE TABLE public.scratch_rows (
    id integer PRIMARY KEY,
    tenant text NOT NULL,
    secret text NOT NULL
);

CREATE TABLE public.protected_rows (
    id integer PRIMARY KEY,
    tenant text NOT NULL,
    secret text NOT NULL
);

REVOKE ALL ON TABLE public.scratch_rows FROM PUBLIC;
REVOKE ALL ON TABLE public.protected_rows FROM PUBLIC;

CREATE VIEW public.guard_view_old AS
 SELECT id, tenant, secret FROM public.scratch_rows;

GRANT SELECT, INSERT, UPDATE ON TABLE public.guard_view_old TO PUBLIC;

-- VM1 owner view-query insertion point
CREATE OR REPLACE VIEW public.guard_view_old AS
 SELECT id, tenant, secret FROM public.protected_rows
 WHERE tenant = 'public';
ALTER VIEW public.guard_view_old SET (check_option='cascaded');

-- VM1 attacker view-option insertion point
ALTER VIEW public.guard_view_old RESET (check_option);

-- VM1 owner rename insertion point
ALTER VIEW public.guard_view_old RENAME TO guard_view_new;

SET search_path TO "$user", public;

INSERT INTO "schema_migrations" (version) VALUES
('20261010130200'),
('20261010130100'),
('20261010130000');
