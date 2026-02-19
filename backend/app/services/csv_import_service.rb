require "csv"

class CsvImportService
  attr_reader :data_attributes

  def initialize(data_attributes)
    @data_attributes = data_attributes
  end

  def self.call(path: "", headers: [])
    unless File.exist?(path)
      return "Arquivo não encontrado: #{path}"
    end

    @data_attributes = []
    CSV.foreach(path, headers: true, encoding: "utf-8", col_sep: ";") do |row|
      next if row.to_h.values.all?(&:nil?)

      @data_attributes << row.to_h
    end

    self.new(@data_attributes)
  end

  def count = @data_attributes.count
end
