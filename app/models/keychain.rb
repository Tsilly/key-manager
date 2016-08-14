class Keychain < ActiveRecord::Base
  default_scope { order(created_at: :desc) }
  
  validates_presence_of :title
  validates_presence_of :username
  validates_presence_of :url

  validates :password, length: { minimum: 14 }, :presence => true
  validate :validate_password
  belongs_to :category, foreign_key: :category_id

  def self.generate_key
    digits       = [*(0..9)]
    uppers       = [*('A'..'Z')]
    letters      = [*('A'..'Z'), *( 'a'..'z')]
    spe_chrs     = [*('!'..'/'), *(':'..'?')]

    # Generate required key (len = 5)
    good_key = []
    good_key << digits.sample(3) << uppers.sample(1) << letters.sample(9) << spe_chrs.sample(1)

    # Shuffle and join key array
    return good_key.flatten.shuffle.join
  end
  
  private
  def validate_password
    str = self.password 
    errors.add(:password, :invalid, message: 'should not contain whitespace') if str.match(/\s/) # No White Space
    # Sort password
    str = str.split("").map(&:strip).sort.join
    errors.add(:password, :invalid, message: 'should contain at least 3 digits') unless str.match(/\d{3,}/) # 3+ digits
    errors.add(:password, :invalid, message: 'should contain at least 10 letters') unless str.match(/\p{L}{10,}/) # 10+ letter
    errors.add(:password, :invalid, message: 'should contain at least 1 capital letter') unless str.match(/\p{Lu}/) # 1 Capital letter
    errors.add(:password, :invalid, message: 'should contain at least 1 special character (#, @, !...)') unless str.match(/\W+/) # 1 Special letter
    # Provide key sugesstion
    goodkey = Keychain.generate_key
    errors.add(:password, :suggestion, message: "suggestion: #{goodkey} ") if errors.include?(:password)
  end
end
