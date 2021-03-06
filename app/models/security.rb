class Security < ApplicationRecord
  require 'csv'

  belongs_to :issuer
  belongs_to :security_type
  belongs_to :interest_frequency
  belongs_to :rating
  belongs_to :rating_agency
  has_many :port_folio_security


  self.per_page = 10

  scope  :fetch_analyse_data, -> {select("securities.isin", "interest_frequencies.frequency", "securities.interest_frequency_id", "securities.issue_date", "securities.maturity_date", "securities.id", "archival_ndsoms.ytm", "archival_ndsoms.id as a_id", "archival_ndsoms.trade_price")
                                  .joins("INNER JOIN archival_ndsoms ON archival_ndsoms.isin = securities.isin
                                  JOIN interest_frequencies ON interest_frequencies.id = securities.interest_frequency_id ORDER BY securities.isin").uniq(&:isin)
                                  }


  def self.to_csv
    attributes = %w{id issuer_id security_type_id security_type_id security_name isin issue_date maturity_date outstanding_stock face_value coupon_rate created_at updated_at}
    CSV.generate(headers: true) do |csv|
      csv << attributes

      all.each do |security|
        csv << attributes.map{ |attr| security.send(attr) }
      end
    end
  end

  def self.import(file)
    csv_text = File.read(file.path)
    csv = CSV.parse(csv_text, :headers => true)
    csv.each do |row|
      begin
        self.set_associated_params(row["Issuer Name"], row["Security Type"], row["Interest Frequency"], row["Rate"], row["Rating Agency"])
        self.set_non_associated_params(row)
        self.find_or_create_by!(
          issuer_id: @issuer.id,
          security_type_id: @security_type.id,
          interest_frequency_id: @interest_frequency.id,
          security_name: @issuer.name,
          isin:  @isin,
          issue_date: @date_issued,
          maturity_date: @date_maturity,
          outstanding_stock: @outstanding_stock,
          face_value: @face_val,
          coupon_rate: @coupon_rate,
          rating_agency_id: @rating_agency.id,
          rating_id: @rating.id,
          )
      rescue => e
        return false
      end
    end
    return true if self.count > 0
  end

  def self.set_associated_params(issuer, security_type, interest_frequency, rate, rating_agency)
    @issuer = Issuer.find_or_create_by(name: issuer)
    @security_type = SecurityType.find_or_create_by(security_type_name: security_type, issuer_id: @issuer.id)
    @interest_frequency = InterestFrequency.find_or_create_by(frequency: interest_frequency.to_i)
    @rating_agency = RatingAgency.find_or_create_by(rating_agency_name: rating_agency)
    @rating = Rating.find_or_create_by(rating: rate, rating_agency_id: @rating_agency.id)
  end

  def self.set_non_associated_params(row)
    @isin = row["ISIN"]
    @date_issued = row["Date Of Issue"].to_date
    @date_maturity = row["Date Of Maturity"].to_date
    @outstanding_stock = row["Outstanding Stock"].to_f
    @face_val = row["Face Value"]
    @coupon_rate = row["Coupon Rate"].to_f
  end
    
  validates_presence_of :issuer_id, :security_type_id, :interest_frequency_id, :security_name, 
    :isin, :issue_date, :maturity_date, :outstanding_stock, :face_value, :coupon_rate, :rating_id, :rating_agency_id
end

