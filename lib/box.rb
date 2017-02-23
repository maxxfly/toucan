class Box

  def get_all
  end

  def self.scan_new_box_for_users(users)
    boxes = self.get_all

    users.each do |user|
      user[:available_boxes] = boxes.select do |box|
        # for every box, we keep only the box
        # where the intersection with the user's available_boxes
        # gives no element
        (box[:contents] & user[:received_contents]).count == 0
      end.map{|b| b[:code] }.sort
    end

    users
  end
end
