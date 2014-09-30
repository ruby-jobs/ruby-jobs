atom_feed :language => 'pr-BR' do |feed|
  feed.title @title
  feed.updated @updated

  @job.each do |item|
    next if item.updated_at.blank?

    feed.entry( item ) do |entry|
      entry.url job_url(item)
      entry.title item.title
      entry.description item.description, :type => 'html'

      entry.company do |company|
        company.name item.email
      end
    end
  end
end
