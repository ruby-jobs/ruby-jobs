class JobSearch
  attr_reader :title, :modality, :page
  def initialize(params)
    if params[:filter]
      filter = OpenStruct.new(JSON.parse(params[:filter]))
      @title = filter.title unless filter.title.blank?
      @modality = filter.modality unless filter.modality.blank?
    end
    @page = params[:page]
  end

  def search
    @jobs = Job.page(page)
    @jobs.where!('title LIKE ?', "%#{title}%") if title
    @jobs.where!(modality: modality) if modality
    @jobs
  end
end
