RSpec.describe SearchService::Suggest, elasticsearch: true do
  let!(:book_1)   { create(:book, title: 'John Karter') }
  let!(:book_2)   { create(:book, title: 'The book not for search') }
  let!(:author_1) { create(:author, name: 'John Jackson') }
  let!(:author_2) { create(:author, name: 'J.R.R. Tolkien') }

  describe '#search' do
    subject { SearchService::Suggest.search('John').records.records }

    before { import_records }
    after { clear_indices }

    it { is_expected.to contain_exactly(book_1, author_1) }
  end
end