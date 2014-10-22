module ApplicationHelper
  def remote_tag(remote)
    if remote
      %(<span class="label label-default">Remoto</span>).html_safe
    else
      %(<span class="label label-default">Local</span>).html_safe
    end
  end

  def navbar(*menus)
    menus.reduce('') { |a, e| a << menu_html(e) }
  end

  def menu_html(value)
    "<li class='#{'active' if current_page?(value[1])}'>
      #{link_to value[0], value[1]}
    </li>"
  end
end
