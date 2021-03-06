require 'rails_helper'

RSpec.describe Article, type: :model do
  describe '#validations' do  # hash->instance method
    let(:article) { build(:article) }
    it 'tests that factory is valid' do
      expect(article).to be_valid #article.valid? = true
    end
  
    it 'has an valid title' do
      article.title = '' #override the default value in factory with empty string
      expect(article).not_to be_valid
      expect(article.errors[:title]).to include("can't be blank")
    end
    it 'has an invalid content' do
      article.content = ''
      expect(article).not_to be_valid
      expect(article.errors[:content]).to include("can't be blank")
    end

    it 'has an invalid slug' do
      article.slug = ''
      expect(article).not_to be_valid
      expect(article.errors[:slug]).to include("can't be blank")
    end

    it 'validates the uniqueness of the slug' do
      article1 = create(:article)
      expect(article1).to be_valid
      article2 = build(:article, slug: article1.slug)
      expect(article2).not_to be_valid
      expect(article2.errors[:slug]).to include('has already been taken')
    end
  end

  describe '.recent' do #dot->class method
    it 'returns article in the correct order' do
      older_article =
        create(:article, created_at: 1.hour.ago)
      recent_article = create(:article)

      expect(described_class.recent).to eq(
        [recent_article, older_article]
      )

      recent_article.update_column(:created_at, 2.hours.ago)
      expect(described_class.recent).to eq(
        [older_article, recent_article]
      )
    end
  end
  
end
