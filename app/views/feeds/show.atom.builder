feed_options = {
  language: 'fr-FR',
  id: feed_url(@feed, format: 'atom')
}

atom_feed feed_options do |feed|
  feed.title @feed.name
  feed.updated @feed.items.maximum(:date)
  @feed.items.each do |item|
    feed.entry item, url: item.article_link do |entry|
      entry.title item.title
      entry.content item.description
      entry.author do |author|
        author.name item.user.decorate.name
      end
      entry.updated item.date.to_datetime.rfc3339
    end
  end
end
