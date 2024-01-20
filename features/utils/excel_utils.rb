require 'roo'
require_relative 'environment'

class ExcelUtils
attr_reader :path, :work_sheet, :work_book

    def initialize(path)
        @path = path

        begin
            # Open the excel file
            if File.extname(path) == '.xlsx'
                # include Roo::Excelx
                excel_file = Roo::Excelx.new(path)
              elsif File.extname(path) == '.xls'
                # include Roo::Excel
                excel_file = Roo::Excel.new(path)
              else
                raise "Unsupported Excel file format"
            end

            # Access the required test data sheet
            @work_book = excel_file
            @work_sheet = excel_file.sheet(Environment.get_pages_info_sheet_name)

            # check if sheet is null or not. nil means sheetname was wrong
            raise "Sheet: '#{@work_sheet}' does not exist" if @work_sheet.nil?

        rescue StandardError => element
            raise "Error opening Excel file: #{element.message}"
        end


    end

    def get_cell_data(row_num, col_num)
        begin
            cell = @work_sheet.row(row_num)[col_num]
            cell
        rescue StandardError => element
            raise "Error retrieving cell data: #{element.message}"
        end
    end

end