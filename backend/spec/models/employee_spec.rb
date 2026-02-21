require 'rails_helper'

RSpec.describe Employee, type: :model do
  context 'associations' do
    it { is_expected.to belong_to(:company) }
    it { is_expected.to belong_to(:company_department) }
    it { is_expected.to belong_to(:company_function) }
    it { is_expected.to belong_to(:company_position) }

    it { is_expected.to belong_to(:level_area).class_name('LevelArea') }
    it { is_expected.to belong_to(:level_directorate).class_name('LevelDirectorate') }
    it { is_expected.to belong_to(:level_management).class_name('LevelManagement') }
    it { is_expected.to belong_to(:level_coordination).class_name('LevelCoordination') }
  end
end
