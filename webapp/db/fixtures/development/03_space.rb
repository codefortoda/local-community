require 'csv'

def import_csv(file_name)
  csv = CSV.read("#{Rails.root}/db/fixtures/csv/#{file_name}", encoding: 'Shift_JIS:UTF-8')
  csv.each_with_index do |line, idx|
    next if idx.zero?
    yield(line, idx) if block_given?
  end
end

def create_space(line)
  # 施設ID
  facility_identifier = line[0]
  facility = Facility.where(identifier: facility_identifier).first

  Space.seed do |space|
    # スペースID
    # スペース名称
    space.name = line[2]
    # 画像
    space.image = File.open( "#{Rails.root}/db/fixtures/csv/images/space/#{line[3]}") unless line[3].blank?
    # その他自由記述欄
    space.detail = line[4]
    space.facility_id = facility.id
  end
end


import_csv('space.csv') do |line, idx|
  create_space(line)
end

