json.trechos @excerpts do |excerpt|
  report = excerpt.report
  json.id excerpt.id
  json.coordenadas [report.addr_lat, report.addr_lon]
  json.data l(report.interview_date)
  json.entrevistado report.interviewee
  json.trecho excerpt.article_rendered
  json.linhas_analise excerpt.line_analyses do |line|
    json.id line.id
    json.nome line.name
  end
end
