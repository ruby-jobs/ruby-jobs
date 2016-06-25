module Api
  module V1
    class JobsController < ApplicationController
      before_action :set_job, only: [:show]

      def index
        @jobs = Job.page(page_params).per(10)

        render json: @jobs,
               root: false,
               each_serializer: ::Api::V1::JobSerializer
      end

      def show
        render json: @job,
               root: false,
               serializer: ::Api::V1::JobSerializer
      end

      private

      def set_job
        @job = Job.find(params[:id])
      end

      def page_params
        params[:page] || 1
      end
    end
  end
end
