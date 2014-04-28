module ApplicationHelper

  def form_auth_token
    "<input name=\"authenticity_token\" value=\"#{ form_authenticity_token }\" type=\"hidden\">".html_safe
  end

end
