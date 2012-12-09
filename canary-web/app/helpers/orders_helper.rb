#encoding: utf-8

module OrdersHelper
  def convert_status(status)
    result = ""
    case status
    when "unpay"
      result = "未付款"
    when "payed"
      result = "已付款"
    when "checked"
      result = "已入住"
    when "canceled"
      result = "已取消"
    else
      result = "未知"
    end
    result
  end
end
