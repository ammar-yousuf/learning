require 'roo'

class ExcelLoader
  def self.run
    input_file = File.join(Rails.root, 'sample.xls')
    s = Roo::Excel.new(input_file)
    s.default_sheet = s.sheets.first
    # Returns a Hash version of the spreadsheet's first page
    result = read_each_row(s)

    # Now must update the record in the database
    update_database_table(result)  
  end

  def self.read_each_row(sheet)
    sheet_headers = sheet.row(1)
    sheet_3d = []

    2.upto(sheet.last_row) do | row_number |
      row = sheet.row(row_number)
      new_row = {}

      sheet_headers.each_with_index do |header, index|
        new_row[header] = row.at(index)
      end
      
      sheet_3d << new_row      
    end
    sheet_3d
  end

  def self.update_database_table(spreadsheet)
    spreadsheet.each do |source|      
      update_or_create_by({name: source["Name"]}, source)
    end
  end

  def self.update_or_create_by(args, attributes)
    d = Source.find_or_create_by(args)    
    
    r = d.update_attributes({})
    # Fill in the hash above with what attributes you want to update.

    puts "*"*100
    puts "Successfully Updated" if r
  end
end