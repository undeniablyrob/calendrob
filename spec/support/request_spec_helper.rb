module RequestSpecHelper
  def json
    return {} if response.body.empty?
    JSON.parse(response.body)
  end
end
