atom_feed language: 'pt-BR' do |feed|
  feed.title @title
  feed.updated @updated

  @job.each do |item|
    next if item.updated_at.blank?

    feed.entry(item) do |entry|
      entry.title item.title
      entry.company item.company
      entry.contact item.email
      entry.description item.description
      entry.skills item.skills if item.skills.present?
      entry.location item.location if item.location.present?
      entry.modality item.modality if item.modality.present?
      entry.website item.website if item.website.present?
      entry.salary item.salary if item.salary.present?
      entry.url item.url if item.url.present?

      entry.content render('job_description.html', job:  JobPresenter.new(item), show_image: false), type: 'html'

      entry.author do |author|
        author.name item.company
      end
    end
  end
end
