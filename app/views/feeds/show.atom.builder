feed_options = {
  language: 'fr-FR',
  id: feed_url(@feed, format: 'atom')
}

atom_feed feed_options do |feed|
  feed.title @feed.name
  feed.updated @feed.items.maximum(:date)
  @feed.items.each do |item|
    feed.entry item do |entry|
      entry.title item.title
      entry.content item.description
      entry.author do |author|
        author.name item.user.decorate.name
      end
      entry.updated item.date
      entry.url item.article_link
    end
  end
end
