# encoding: UTF-8
# frozen_string_literal: true

module API
  module V2
    module Public
      class Tools < Grape::API
        desc 'Get server current time, in seconds since Unix epoch.'
        get "/timestamp" do
          ::Time.now.iso8601
        end

        desc 'Get running Peatio version and build details.'
        get "/version" do
          {
            git_tag: Peatio::Application::GIT_TAG,
            git_sha: Peatio::Application::GIT_SHA,
            build_date: DateTime.rfc3339(Peatio::Application::BUILD_DATE),
            version: Peatio::Application::VERSION
          }.tap do |v|
            present OpenStruct.new(v), with: Entities::Version
          end
        end
      end
    end
  end
end
