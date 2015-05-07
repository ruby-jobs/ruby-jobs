atom_feed language: 'pt-BR' do |feed|
  feed.title @title
  feed.updated @updated

  @job.each do |item|
    next if item.updated_at.blank?

    feed.entry(item) do |entry|
      entry.title item.title
      entry.content item.description, type: 'html'

      entry.author do |author|
        author.name item.company
      end
    end
  end
end
