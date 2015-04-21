module JobsHelper
  def link_to_twitter(title)
    escaped_url = CGI.escape(request.url)

    url = 'https://twitter.com/intent/tweet?'
    url += 'hashtags=RubyJobs&'
    url += "original_referer=#{escaped_url}&"
    url += "text=Vaga%20para%20#{CGI.escape(title)}&"
    url += "w_p=tweetbutton&url=#{escaped_url}"

    render partial: 'jobs/link_to_twitter', locals: { url: url, title: title }
  end

  def modalities_hash
    { 'Presencial' => :presencial, 'Remoto' => :remote, 'Freela' => :freela, 'Trainee' => :trainee }
  end

  def salaries_hash
    { 'N/A' => :undefined, 'Abaixo de R$3.000' => :intern, 'R$3.000 - R$6.000' => :junior,
      'R$6.000 - R$9.000' => :medium, 'Acima de R$9.000' => :senior }
  end

  def contract_types_hash
    { 'Não Especificado' => :not_specified, 'CLT' => :clt, 'PJ' => :pj }
  end
end
