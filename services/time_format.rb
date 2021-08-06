class TimeFormat
  TIME_FORMATS = {
                  'year' => '%Y',
                  'month' => '%m',
                  'day' => '%d',
                  'hour' => '%H',
                  'minute' => '%M',
                  'second' => '%S'
                  }.freeze

  def initialize(params = {})
    @date_format = Array(params[:format_data])
    @formats = []
    @wrong_formats = []
  end

  def call
    parse_format
    return unknown_format unless valid_format?

    Time.now.strftime(@formats.join('-'))
  end

  def valid_format?
    @wrong_formats.empty?
  end

  private

  def unknown_format
    "Unknown time formats: #{@wrong_formats}"
  end

  def parse_format
    return if @date_format.empty?

    @date_forma.each do |f|
      if TIME_FORMATS.key?(f)
        @formats << TIME_FORMATS[f]
      else
        @wrong_formats << f
      end
    end
  end
end