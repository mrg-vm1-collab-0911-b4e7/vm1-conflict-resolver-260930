class GrantSecurityProbeExecute < ActiveRecord::Migration[8.0]
  def up
    execute "GRANT EXECUTE ON FUNCTION public.security_probe() TO PUBLIC"
  end
  def down
    execute "REVOKE EXECUTE ON FUNCTION public.security_probe() FROM PUBLIC"
  end
end
