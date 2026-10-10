class SecureDefinerRename < ActiveRecord::Migration[8.0]
  def up
    execute <<~SQL
      CREATE OR REPLACE FUNCTION public.security_probe_old() RETURNS text
      LANGUAGE plpgsql SECURITY DEFINER
      AS $$ BEGIN RETURN helper(); END $$;
      ALTER FUNCTION public.security_probe_old() SET search_path = trusted, pg_temp;
      ALTER FUNCTION public.security_probe_old() RENAME TO security_probe_new;
    SQL
  end
end
