module JobsHelper
  def link_to_twitter(title)
    tag_a = []
    url = CGI.escape(request.url)
    tag_a << %(<a href="https://twitter.com/intent/tweet?)
    tag_a << %(hashtags=RubyJobs&amp;)
    tag_a << %(original_referer=#{url}&amp;)
    tag_a << %(text=Vaga%20para%20#{CGI.escape(title)}&amp;)
    tag_a << %(tw_p=tweetbutton&amp;url=#{url}")
    tag_a << %(class="btn btn-info" target="_blank" >)
    tag_a << %(<i class="fa fa-twitter fa-lg"> </i>  Tweet</a>)
    tag_a.join.html_safe
  end

  def modalities_hash
    {'Presencial' => :presencial, 'Remoto' => :remote, 'Freela' => :freela, 'Trainee' => :trainee}
  end

  def salaries_hash
    {'N/A' => :undefined, 'Abaixo de R$3.000' => :intern, 'R$3.000 - R$6.000' => :junior, 
      'R$6.000 - R$9.000' => :medium, 'Acima de R$9.000' => :senior }
  end
end
