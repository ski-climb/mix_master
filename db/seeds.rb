if Artist.count == 0
  20.times do |n|
    Artist.create(name: "Artist Q. Salamanderson #{n + 1}", image_path: "http://cps-static.rovicorp.com/3/JPG_400/MI0003/146/MI0003146038.jpg")
  end
end
