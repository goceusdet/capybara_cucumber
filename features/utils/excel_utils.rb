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

    # gets excel data as 2D array:
    def get_data_array
        data = Array.new(row_count) { Array.new(column_count) }
      
            (0...row_count).each do |i|
            (0...column_count).each do |j|
                    value = get_cell_data(i, j)
                    data[i][j] = value
                end
        end
        data
    end

    # gets data array from excel file without the first row
    def get_data_array_without_first_row
        data = Array.new(row_count - 1) { Array.new(column_count) }
      
        (2...row_count).each do |i|
          (0...column_count).each do |j|
            value = get_cell_data(i, j)
            data[i - 1][j] = value
          end
        end
      
        data
    end

    # gets excel data as a list/array
    def get_data_list
        columns = get_columns_names
        data = []
      
        (2...row_count).each do |i|
          row = @work_sheet.row(i)
          row_map = {}
      
          row.each_with_index do |cell_value, j|
            column_name = columns[j]
            row_map[column_name] = cell_value.to_s
          end
      
          data << row_map
        end
      
        data
    end

    # gets column names from excel file:
    def get_columns_names
        columns = []
        @work_sheet.row(1).each do |cell|
          columns << cell.to_s
        end
        columns
    end

    # gets total amount of columns in the excel file:
    def column_count
    @work_sheet.first_column.upto(@work_sheet.last_column).count
    end

    # gets the total amount of rows in the excel file:
    def row_count
    @work_sheet.last_row + 1
    end



end