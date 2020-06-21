class Api::V1::MaskController < ApplicationController
   #encoding:UTF-8
   def index
   datas = HTTParty.get('https://quality.data.gov.tw/dq_download_json.php?nid=116285&md5_url=2150b333756e64325bdbc4a5fd45fad1')
   data =[]
   datas = JSON.parse(datas.body)
   puts datas
    for i in 0...datas.length do
      c = datas[i]
      f = {} 
        f[:id] = c["醫事機構代碼"]
        f[:name] = c["醫事機構名稱"]
        f[:address] = c["醫事機構地址"]
        f[:phone]  = c["醫事機構電話"]
        f[:mask_adult] = c["成人口罩剩餘數"]
        f[:mask_child] = c["兒童口罩剩餘數"]
        f[:update_time] = c["來源資料時間"]
      data.push(f)
     end 
      @response = data
      render json: @response
     end
end