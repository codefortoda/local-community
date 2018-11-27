require 'csv'

def import_csv(file_name)
  csv = CSV.read("#{Rails.root}/db/fixtures/csv/#{file_name}", encoding: 'Shift_JIS:UTF-8')
  csv.each_with_index do |line, idx|
    next if idx.zero?
    yield(line, idx) if block_given?
  end
end

def create_facility(line, facility_category_id)
  Facility.seed do |facility|
    facility.identifier = line[0] # 識別情報
    facility.organization_code = line[1] # 団体コード
    facility.organization_name = line[2] # 団体名
    facility.identifier_name = line[3] # 識別
    facility.name = line[4] # 施設名
    facility.overview = line[5] # 概要
    facility.common_name = line[6] # 通称
    facility.address = line[7] # 住所
    facility.latitude = line[8]  # 緯度
    facility.longitude = line[9] # 経度
    facility.tel = line[10] # 電話番号
    facility.url = line[11] # ホームページ
    facility.barrier_free = line[12]  # バリアフリー情報
    # 画像
    facility.image = File.open( "#{Rails.root}/db/fixtures/csv/images/facility/#{line[13]}") unless line[13].blank?
    facility.start_time = line[14] # 開始時間
    facility.end_time = line[15] # 終了時間
    facility.use = line[16] # 利用用途
    facility.service = line[17] # サービス情報
    facility.fixture = line[18] # 設備情報

    facility.renting_space = true unless line[19].blank? # 利用可能なスペース
    facility.conference = true unless line[20].blank? # 会議
    facility.performance = true unless line[21].blank? # 公演
    facility.sports = true unless line[22].blank? # 運動
    facility.classroom = true unless line[23].blank? # 教室
    facility.flyer = true unless line[24].blank? # チラシを置ける

    facility.facility_category_id = facility_category_id
  end
end


def create_facilit_park(line, facility_category_id)
  Facility.seed do |facility|
    # 識別情報	
    facility.identifier = line[0] # 識別情報
    # 団体コード
    facility.organization_code = line[1] # 団体コード
    # 種別
    #団体名
    facility.organization_name = line[3] # 団体名
    # 概要
    # 名称
    facility.name = line[5] # 施設名
    # 住所_表記
    facility.address = line[6] # 住所
    # 通称
    facility.common_name = line[7] # 通称
    # 施設_緯度
    facility.latitude = line[8]  # 緯度
    # 施設_経度
    facility.longitude = line[9] # 経度
    # ホームページ
    facility.url = line[10] # ホームページ
    # 施設_電話番号
    facility.tel = line[11] # 電話番号
    # 開始時間
    # 終了時間
    # 自由記述欄
    facility.overview = line[15] # 概要
    # 日時備考

    facility.facility_category_id = facility_category_id
  end
end


# ----------------------------------------
# 市役所・支所
# ----------------------------------------
import_csv('26277.csv') do |line, idx|
  create_facility(line, 1)
end

# ----------------------------------------
# 健康・障害・福祉施設
# ----------------------------------------
import_csv('23897.csv') do |line, idx|
  create_facility(line, 2)
end


# ----------------------------------------
# 教育関連施設
# ----------------------------------------
import_csv('23898.csv') do |line, idx|
  create_facility(line, 3)
end

# ----------------------------------------
# 消防
# ----------------------------------------
import_csv('23899.csv') do |line, idx|
  create_facility(line, 4)
end

# ----------------------------------------
# 文化・スポーツ施設・公園
# ----------------------------------------
import_csv('23900.csv') do |line, idx|
  create_facility(line, 5)
end

# ----------------------------------------
# 子育て関連施設
# ----------------------------------------
import_csv('23901.csv') do |line, idx|
  create_facility(line, 6)
end

# ----------------------------------------
# 公民館等
# ----------------------------------------
import_csv('23902.csv') do |line, idx|
  create_facility(line, 7)
end

# ----------------------------------------
# その他公共施設
# ----------------------------------------
import_csv('23903.csv') do |line, idx|
  create_facility(line, 8)
end

# ----------------------------------------
# 公園(いいとだパーク)
# ----------------------------------------
import_csv('27487.csv') do |line, idx|
  create_facilit_park(line, 9)
end
