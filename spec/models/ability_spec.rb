require 'spec_helper'

describe Ability do

	it 'allows admin user to manage all and to access rails admin panel' do
    user = create(:user, :professor)
    ability = Ability.new(user)

    expect(user.role).to eq 'professor'
    
    expect { ability.can? :manage, Subject }.to be_true
  end

  it 'does not allows standart user to manage all and to access rails admin panel' do
    user = create(:user)
    ability = Ability.new(user)

    expect(user.role).to eq 'student'

    expect { ability.cannot? :manage, Subject }.to be_true
    expect { ability.can? :read, Subject }.to be_true
  end
end