module ApplicationHelper
  def remote_tag(remote)
    if remote
      %(<span class="label label-default">Remoto</span>).html_safe
    else
      %(<span class="label label-default">Local</span>).html_safe
    end
  end
end
