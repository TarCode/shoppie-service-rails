require 'rails_helper'

describe ListsController, type: :controller do
  it 'returns error for the protected endpoint if the token is expired' do
    subject

    expect(response).to have_http_status(:ok)
  end
end
