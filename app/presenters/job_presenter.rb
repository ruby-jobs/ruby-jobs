class JobPresenter < Burgundy::Item
  def badge
    "#{modality}-badge.png"
  end

  def modality_name
    %w(Presencial Remoto Freela Trainee)[Job.modalities[modality]]
  end

  def salary_label
    %w(
      N/A
      Abaixo\ de\ R$3.000
      R$3.000\ -\ R$6.000
      R$6.000\ -\ R$9.000
      Acima\ de\ R$9.000)[Job.salaries[salary]]
  end

  def contract_type_label
    %w(
      Não\ Especificado
      CLT
      PJ)[Job.contract_types[contract_type]]
  end
end
