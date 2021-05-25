module MarkdownText
  extend ActiveSupport::Concern

  included do
    belongs_to :article, dependent: :delete, autosave: true, validate: true, optional: false
    accepts_nested_attributes_for :article
    # default_scope { includes(:article) }
  end

  delegate :markdown, :rendered, to: :article, allow_nil: true
end