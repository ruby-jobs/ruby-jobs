module Api
  module V1
    class JobSerializer < ActiveModel::Serializer
      attributes :id, :title, :location, :company, :created_at, :website,
                 :url, :salary, :modality, :contract_type, :description, :skills

      def salary
        %w(
          N/A
          Abaixo\ de\ R$3.000
          R$3.000\ -\ R$6.000
          R$6.000\ -\ R$9.000
          Acima\ de\ R$9.000
          Valor\ hora\ a\ combinar)[Job.salaries[object.salary]]
      end

      def contract_type
        %w(
          Não\ Especificado
          CLT
          PJ)[Job.contract_types[object.contract_type]]
      end

      def modality
        %w(Presencial Remoto Freela Trainee)[Job.modalities[object.modality]]
      end
    end
  end
end
