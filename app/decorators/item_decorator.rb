class ItemDecorator < Draper::Decorator
  delegate_all

  def feeds_links
    object.feeds.collect {|f| h.link_to f.name.capitalize, h.feed_path(f, format: 'atom')}.join(', ').html_safe
  end

  def link
    h.link_to object.article_link.truncate(40, omission: '...'), object.article_link, target: :blank
  end

end
