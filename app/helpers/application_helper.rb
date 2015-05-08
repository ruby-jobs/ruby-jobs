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

  def markdown(text)
    render_options = {
      filter_html: true,
      hard_wrap: true,
      link_attributes: { rel: 'nofollow' }
    }
    renderer = Redcarpet::Render::HTML.new(render_options)
    Redcarpet::Markdown.new(renderer).render(text).html_safe
  end
end
