class ColdSymptom < ApplicationRecord
  belongs_to :user
  has_many :goals

  validates :symptom_title, presence: true
  validates :symptom_body, presence: true
  validates :solution, presence: true
  validates :image_url, presence: true
  validates :symptom_type, presence: true, numericality: { only_integer: true }
  enum symptom_type: { peripheral: 0, lower: 1, internal: 2, systemic: 3 }

  def localized_symptom_type
    I18n.t("activerecord.attributes.cold_symptom.symptom_type.#{symptom_type}")
  end
end
