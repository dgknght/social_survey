module ApplicationHelper
  BOOTSTRAP_ALERT_MAP = { 'notice' => 'success',
                          'alert'  => 'warning' }

  def flash_name_to_bootstrap_class(name)
    BOOTSTRAP_ALERT_MAP[name] || name
  end
end
