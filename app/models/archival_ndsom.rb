class ArchivalNdsom < ApplicationRecord
  require 'csv'

  def self.import(file)
    csv_text = File.read(file.path)
    csv = CSV.parse(csv_text, :headers => true)
    csv.each do |row|
      begin
        self.set_non_associated_params(row)
        archival_ndsom = ArchivalNdsom.find_or_create_by(
            trade_indicator: @trade_indicator,
            ytm: @ytm,
            trade_price: @trade_price,
            face_value: @face_value,
            security_description: @security_description,
            isin: @isin,
            trade_time: @trade_time,
            trade_date: @trade_date,
          )
        p "Created ArchivalNdsom....."
      rescue => e
        return false
      end
    end
  end

  def self.set_non_associated_params(row)
    @trade_indicator = row["Trade Indicator"]
    @ytm = row["YTM / Yield"].to_f
    @trade_price = row["Trade Price"].to_f
    @face_value = row["Face Value"]
    @security_description = row["Security Description"]
    @isin = row["ISIN"]
    @trade_time = row["Trade Time"].to_time
    @trade_date = row["Trade Date"].to_date
  end

end
