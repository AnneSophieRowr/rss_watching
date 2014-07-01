feed_options = {
  language: 'fr-FR',
  id: @feed.friendly_id
}

atom_feed feed_options do |feed|
  feed.title @feed.name
  @feed.items.each do |item|
    feed.entry item do |entry|
      entry.link item.article_link
      entry.title item.title
      entry.description item.description
      entry.author do |author|
        author.name item.user.decorate.name
      end
      entry.pubDate item.date
    end
  end
end
