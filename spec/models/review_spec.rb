require 'rails_helper'

describe Review do
  it { should belong_to(:product) }
end
