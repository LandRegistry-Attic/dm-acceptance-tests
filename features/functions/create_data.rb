def generate_title_number
  title_number = Pxeger.new('^([A-Z]{0,3}[1-9][0-9]{0,5}|[0-9]{1,6}[ZT])$')
  title_number.generate
end

def create_deed_hash(title_number = generate_title_number)
  {
    title_number: title_number
  }
end
