class DataReversion
  def self.process(data = {})
    reverse_recursively(check_data(data))
  end

  private

  def self.check_data(data)
    data = data.to_h unless data.respond_to?(:each_pair)
    data
  rescue NoMethodError # catches the errors for non-convertible objects
    {}
  end

  def self.reverse_recursively(data)
    data.each_pair do |k, v|
      data[k] = v.is_a?(Hash) ? reverse_recursively(v) : v.to_s.reverse
    end
  end
end
