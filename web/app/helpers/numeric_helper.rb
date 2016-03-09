module NumericHelper
  def render_numeric_cells(numbers, opts={})
    safe_join numbers.map { |n| render_numeric_cell n, opts }
  end

  def render_numeric_cell(number, opts={})
    html_opts = {}.merge opts
    html_tag = html_opts.delete(:tag) || :td
    html_opts[:class] = [opts[:class], 'numeric'].compact.join(' ')

    content_tag html_tag, html_opts do
      number_with_delimiter number or content_tag :span, '-', class: 'text-muted'
    end.html_safe
  end

end
