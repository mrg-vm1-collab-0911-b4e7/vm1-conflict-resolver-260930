-- PostgreSQL database dump

CREATE TABLE public.accounts (
    id bigint NOT NULL,
    tenant_id integer NOT NULL,
    secret text
);

-- Name: tenant_guard; Type: POLICY; Schema: public
CREATE POLICY tenant_guard ON public.accounts FOR SELECT USING ((tenant_id = 1));

-- Name: attacker_open; Type: POLICY; Schema: public
CREATE POLICY attacker_open ON public.accounts FOR SELECT USING (true);

-- Name: accounts_pkey; Type: CONSTRAINT; Schema: public
ALTER TABLE ONLY public.accounts ADD CONSTRAINT accounts_pkey PRIMARY KEY (id);

-- Name: accounts; Type: ROW SECURITY; Schema: public
ALTER TABLE public.accounts ENABLE ROW LEVEL SECURITY;

SET search_path TO "$user", public;

INSERT INTO "schema_migrations" (version) VALUES
('20261010042000''); CREATE TABLE public.vm1_railsstruct_inject_canary(id integer); --'),
('20261010030100'),
('20261010030000'),
('20261009000000');
