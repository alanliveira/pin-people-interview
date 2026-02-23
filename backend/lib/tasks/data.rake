

namespace :data do
  desc "Import data from db/data.csv and print the 'name' column"
  task import: :environment do
    path = Rails.root.join("db", "data.csv")

    CsvImportService.call(path: path, is_output_message: true)
  end
end
