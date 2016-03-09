module ApplicationHelper

  def meta_refresh
    if meta_refresh_rate > 0
      tag :meta, 'http-equiv' => 'refresh', 'content' => meta_refresh_rate
    end
  end

  def refresh_notice
    content_tag :p, class: 'text-info' do
      "This page will refresh every #{pluralize meta_refresh_rate, 'second'}"
    end if meta_refresh_rate > 0
  end

private

  def meta_refresh_rate
    @meta_refresh_rate ||= @meta_refresh.to_i
  end

end
