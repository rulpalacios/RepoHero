require 'rails_helper'

RSpec.describe 'GraphQL, repos query' do
    let!(:repo) { Repo.create!(name: 'Repo hero', url: 'https://github.com/repohero/repohero') }

    it 'retrieves a list of available repos' do
        query = <<~QUERY
            query{
                repos{
                    name
                    url
                }
            }
        QUERY

        post '/graphql', params: { query: query }
        expect(response.parsed_body).not_to have_errors
        expect(response.parsed_body['data']).to eq(
            'repos' => [
                {
                    'name' => 'Repo hero',
                    'url' => 'https://github.com/repohero/repohero'
                }
            ]
        )
    end
end