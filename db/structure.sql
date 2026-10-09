-- PostgreSQL database dump

CREATE TABLE public.accounts (
    id bigint NOT NULL,
    tenant_id integer NOT NULL,
    secret text
);

CREATE ROLE app_reader;

-- Name: tenant_guard; Type: POLICY; Schema: public
CREATE POLICY tenant_guard ON public.accounts FOR SELECT TO app_reader USING ((tenant_id = 1));

-- Name: accounts_pkey; Type: CONSTRAINT; Schema: public
ALTER TABLE ONLY public.accounts ADD CONSTRAINT accounts_pkey PRIMARY KEY (id);

-- Name: accounts; Type: ROW SECURITY; Schema: public
ALTER TABLE public.accounts ENABLE ROW LEVEL SECURITY;

-- Name: TABLE accounts; Type: ACL; Schema: public
-- ACL marker
GRANT SELECT ON TABLE public.accounts TO app_reader;

SET search_path TO "$user", public;

INSERT INTO "schema_migrations" (version) VALUES
('20261010040000'),
('20261009000000');
