feed_options = {
  language: 'fr-FR',
  url: 'some_url'
}

atom_feed feed_options do |feed|
  feed.title @feed.name
  #feed.updated @items.maximum(:publish_date)

  @feed.items.each do |item|
    feed_entry_options = {
      updated:   item.date
    }
    feed.entry item, feed_entry_options do |entry|
      entry.title item.title
      #plain_html = '<b>I\'m plain HTML</b>'
      #entry.content plain_html, type: 'html'
      #entry.content image_tag(item.image.url(:thumb)), type: 'html'
      entry.author do |author|
        author.name item.user.decorate.name
      end
      entry.url item.link
      entry.summary item.description
    end
  end
end
