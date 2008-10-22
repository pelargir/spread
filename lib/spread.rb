module Spread
  def spread(action)
    html = image_tag "spread/email.png", :alt => "Share with a friend", :size => "16x16", :valign => "middle"
    html += link_to "Share with a friend", :action => action, :url => request.url
    content_tag :div, html
  end
end

ActionView::Base.send :include, Spread