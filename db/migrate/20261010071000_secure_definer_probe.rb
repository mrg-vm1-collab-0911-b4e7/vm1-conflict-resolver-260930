class SecureDefinerProbe < ActiveRecord::Migration[8.0]
  def up
    execute <<~SQL
      CREATE OR REPLACE FUNCTION public.security_probe() RETURNS text
      LANGUAGE plpgsql SECURITY DEFINER
      AS $$ BEGIN RETURN helper(); END $$;
      ALTER FUNCTION public.security_probe() SET search_path = trusted, pg_temp;
    SQL
  end
end
