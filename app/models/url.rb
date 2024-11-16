class Url < ApplicationRecord

  after_create :enque_job


  def enque_job
  end
end
