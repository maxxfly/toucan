class Box

  def get_all
  end

  def self.scan_new_box_for_users(users)
    boxes = self.get_all

    users.each do |user|
      user[:available_boxes] = boxes.select do |boxe|
        (boxe[:contents] & user[:received_contents]).count == 0
      end.map{|b| b[:code] }.sort
    end

    users
  end
end
