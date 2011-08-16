atom_feed :language => 'en-US' do |feed|
  feed.title @title
  feed.updated @updated

  @news_items.each do |item|
    next if item.updated_at.blank?

    feed.entry( item ) do |entry|
      entry.url video_url(item)
      entry.title item.name
      entry.content item.summary, :type => 'html'

      # the strftime is needed to work with Google Reader.
      entry.updated(item.updated_at.strftime("%Y-%m-%dT%H:%M:%SZ")) 

      entry.user do |author|
        author.name item.user.name
      end
    end
  end
end
