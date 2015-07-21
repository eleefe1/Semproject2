json.array!(@checkouts) do |checkout|
  json.extract! checkout, :id, :shipname, :shipstreet, :shipcity, :billname, :billstreet, :billcity, :cardnumber, :cardmonth, :cardyear, :cardcvv
  json.url checkout_url(checkout, format: :json)
end
