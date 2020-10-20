AlgoliaSearch.configuration = { application_id: ENV["APPLICATION_ID"], api_key: ENV["ALGOLIA_API_KEY"] }

AlgoliaSearch.configuration = {
  application_id: ENV["APPLICATION_ID"],
  api_key: ENV["ALGOLIA_API_KEY"],
  connect_timeout: 2,
  receive_timeout: 30,
  send_timeout: 30,
  batch_timeout: 120,
  search_timeout: 5
}

Rails.application.eager_load! # Ensure all models are loaded (required in development).

algolia_models = ActiveRecord::Base.descendants.select{ |model| model.respond_to?(:reindex) }

algolia_models.each(&:reindex)
