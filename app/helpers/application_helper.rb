module ApplicationHelper

  def navbar(*menus)
    menus.reduce('') { |a, e| a << menu_html(e) }
  end

  def menu_html(value)
    "<li class='#{'active' if current_page?(value[1])}'>
      #{link_to value[0], value[1]}
    </li>"
  end

  def controller_action
    "#{params[:controller]}-#{params[:action]}"
  end

end
