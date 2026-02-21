require 'rails_helper'

RSpec.describe Employee, type: :model do
  context 'associations' do
    it { should belong_to(:company) }
    it { should belong_to(:company_department) }
    it { should belong_to(:company_function) }
    it { should belong_to(:company_position) }
  end
end
