module JobsHelper
  def link_to_twitter(title)
    escaped_url = CGI.escape(request.url)
    title       = CGI.escape(title)

    url = 'https://twitter.com/intent/tweet?'
    url += 'hashtags=RubyJobs&'
    url += "original_referer=#{escaped_url}&"
    url += "text=Vaga%20para%20#{title}&"
    url += "w_p=tweetbutton&url=#{escaped_url}"

    render partial: 'jobs/link_to_twitter', locals: { url: url }
  end

  def link_to_linkedin(title)
    escaped_url = CGI.escape(request.url)
    title       = CGI.escape(title)

    url = 'https://www.linkedin.com/shareArticle?mini=true&'
    url += "title=#{title}&"
    url += "url=#{escaped_url}&"
    url += "summary=Vaga%20para%20#{title}&"
    url += 'source=RubyJobs'

    render partial: 'jobs/link_to_linkedin', locals: { url: url }
  end

  def modalities_hash
    { 'Presential' => :presencial, 'Remote' => :remote, 'Freela' => :freela, 'Trainee' => :trainee }
  end

  def salaries_hash
    { 'Undefined' => :undefined, 'Less than $750 per month' => :intern, 'Between $ 750 and $ 1,500 per month' => :junior,
      'between $ 1,500 and $ 3,000 per month' => :medium, 'bigger than $ 2,250 per month' => :senior,
      'to match' => :value_by_hour  }
  end

  def contract_types_hash
    { 'Not Specified' => :not_specified, 'CLT' => :clt, 'PJ' => :pj }
  end
end
