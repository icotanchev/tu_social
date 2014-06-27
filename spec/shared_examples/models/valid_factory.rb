shared_examples 'valid factory' do
  it 'has a valid factory' do
    expect(build(described_class)).to be_valid
  end
end