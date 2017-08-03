require 'rails_helper'

RSpec.describe Employee, type: :model do
  describe 'about singleton methods' do
    describe '.genders' do
      it { expect(Employee.genders).to eq('male' => 0, 'female' => 1, 'other' => 2) }
    end
    describe '.gender_text' do
      it('with male') { expect(Employee.gender_label(:male)).to eq '男性' }
      it('with female') { expect(Employee.gender_label(:female)).to eq '女性' }
      it('with other') { expect(Employee.gender_label(:other)).to eq 'その他' }
    end
    describe '.gender_value' do
      context('with male') { it { expect(Employee.gender_value(:male)).to eq 0 } }
      context('with female') { it { expect(Employee.gender_value(:female)).to eq 1 } }
      context('with other') { it { expect(Employee.gender_value(:other)).to eq 2 } }
    end
    describe '.gender_texts' do
      it { expect(Employee.gender_labels).to eq('male' => '男性', 'female' => '女性', 'other' => 'その他') }
    end
  end
  describe 'about instance methods' do
    let(:male) { create(:employee_male) }
    let(:female) { create(:employee_female) }
    let(:other) { create(:employee_other) }
    describe '#gender_label' do
      context('about male') { it { expect(male.gender_label).to eq '男性' } }
      context('about female') { it { expect(female.gender_label).to eq '女性' } }
      context('about other') { it { expect(other.gender_label).to eq 'その他' } }
    end
    describe '#gender_value' do
      context('about male') { it { expect(male.gender_value).to eq 0 } }
      context('about female') { it { expect(female.gender_value).to eq 1 } }
      context('about other') { it { expect(other.gender_value).to eq 2 } }
    end
  end
end
