class PublicHelperOldIdentityPath < ActiveRecord::Migration[8.0]
  def up
    execute <<~SQL
      CREATE FUNCTION public.helper() RETURNS text
      LANGUAGE sql SECURITY INVOKER
      AS $$ SELECT secret FROM private_data LIMIT 1 $$;
      ALTER FUNCTION public.security_probe_old() SET search_path = public, trusted;
    SQL
  end
end
