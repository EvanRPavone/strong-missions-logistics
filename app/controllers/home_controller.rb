class HomeController < ApplicationController
  def index
  end

  def about

  end

  def staff

  end

  def download_pdf
    send_file(
      "#{Rails.root}/public/2020_TEAM_PACKET.pdf",
      filename: "SM_payment_process.pdf",
      type: "application/pdf"
    )
  end
end
