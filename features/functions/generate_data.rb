def generate_title_no
  title_no = Pxeger.new('^([A-Z]{0,3}[1-9][0-9]{0,5}|[0-9]{1,6}[ZT])$')
  title_no.generate
end

def create_title_hash(title_no = generate_title_no)
  {
    'title-number' => title_no
  }
end
