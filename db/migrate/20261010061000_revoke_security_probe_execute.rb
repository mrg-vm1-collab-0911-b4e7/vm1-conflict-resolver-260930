class RevokeSecurityProbeExecute < ActiveRecord::Migration[8.0]
  def up
    execute "REVOKE EXECUTE ON FUNCTION public.security_probe() FROM PUBLIC"
  end
  def down
    execute "GRANT EXECUTE ON FUNCTION public.security_probe() TO PUBLIC"
  end
end
